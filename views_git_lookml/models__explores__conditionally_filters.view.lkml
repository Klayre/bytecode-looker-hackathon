view: models__explores__conditionally_filters {
  view_label: "Explores: Conditionally Filters"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ex.value:name::varchar as explore_name,
#                   cff.value:field::varchar as field_name,
#                   cff.value:value::varchar as field_value
#           from lookml.models m
#           , lateral flatten(input => m.explores) ex
#           , lateral flatten(input => ex.value:conditionally_filter:filters) cff ;;


  dimension: conditionally_filters_pk {
    label: "Conditionally Filters PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${field_name} || '-' ${field_value} ;;
    hidden: yes
  }

  dimension: field_name {
    label: "Field Name"
    type: string
    sql: cff.value:field::varchar ;;
  }

  dimension: field_value {
    label: "Field Value"
    type: string
    sql: cff.value:value::varchar ;;
  }

  measure: count {
    label: "Number of Conditionally Filters"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      field_name,
      field_value
    ]
  }

}
