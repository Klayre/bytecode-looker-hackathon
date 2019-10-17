view: models__explores__always_joins {
  view_label: "Explores: Always Joins"
#     sql:  select  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ex.value:name::varchar as explore_name,
#                   aj.value::varchar as view_name
#           from lookml.models m
#           , lateral flatten(input => m.explores) ex
#           , lateral flatten(input => ex.value:always_join) aj  ;;

  dimension: always_join_pk {
    label: "Always Join PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${view_name} ;;
    hidden: yes
  }

  dimension: view_name {
    label: "View Name"
    type: string
    sql: aj.value::varchar ;;
  }

  measure: count {
    label: "Number of Always Joins"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      view_name
    ]
  }

}
