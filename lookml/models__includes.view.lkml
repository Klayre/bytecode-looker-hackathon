view: models__includes {
  view_label: "Models"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   inc.value::varchar as include,
#           from lookml.models m
#           , lateral flatten(input => m.includes) inc ;;

  dimension: includes_pk {
    group_label: "Includes"
    label: "Includes PK"
    type: string
    primary_key: yes
    sql: ${models.model_pk} || '-' ${include} ;;
    hidden: yes
  }

  dimension: include {
    group_label: "Includes"
    label: "Include"
    type: string
    sql: inc.value::varchar ;;
  }

  measure: count {
    label: "Number of Includes"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      include
    ]
  }
}
