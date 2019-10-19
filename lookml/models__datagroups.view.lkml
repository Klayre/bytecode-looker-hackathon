view: models__datagroups {
  view_label: "Models"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   dg.value:max_cache_age::varchar as max_cache_age,
#                   dg.value:name::varchar as name,
#                   dg.value:sql_trigger::varchar as sql_trigger
#           from lookml.models m
#           , lateral flatten(input => m.datagroups) dg ;;

  dimension: datagroup_pk {
    group_label: "Datagroups"
    label: "Datagroup PK"
    type: string
    primary_key: yes
    sql: ${models.model_pk}  || '-' ${name} ;;
    hidden: yes
  }

  dimension: max_cache_age {
    group_label: "Datagroups"
    label: "Max Cache Age"
    type: string
    sql: dg.value:max_cache_age::varchar  ;;
  }

  dimension: name {
    group_label: "Datagroups"
    label: "Datagroup Name"
    type: string
    sql: dg.value:name::varchar ;;
  }

  dimension: sql_trigger {
    group_label: "Datagroups"
    label: "SQL Trigger"
    type: string
    sql: dg.value:sql_trigger::varchar ;;
  }

  measure: count {
    label: "Number of Datagroups"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      name,
      max_cache_age,
      sql_trigger
    ]
  }

}
