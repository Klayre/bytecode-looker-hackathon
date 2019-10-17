view: models__explores__cancel_grouping_fields {
  view_label: "Explores: Cancel Grouping Fields"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ex.value:name::varchar as explore_name,
#                   cgf.value::varchar as field_name
#           from lookml.models m
#           , lateral flatten(input => m.explores) ex
#           , lateral flatten(input => ex.value:cancel_grouping_fields) cgf ;;

  dimension: cancel_grouping_field_pk {
    label: "Cancel Grouping Field PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${field_name} ;;
    hidden: yes
  }

  dimension: field_name {
    label: "Field Name"
    type: string
    sql: cgf.value::varchar ;;
  }

  measure: count {
    label: "Number of Cancel Grouping Fields"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      field_name
    ]
  }

}
