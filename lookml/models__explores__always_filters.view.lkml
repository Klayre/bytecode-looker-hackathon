view: models__explores__always_filters {
  view_label: "Explores"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ex.value:name::varchar as explore_name,
#                   aff.value:field::varchar as field_name,
#                   aff.value:value::varchar as field_value
#           from lookml.models m
#           , lateral flatten(input => m.explores) ex
#           , lateral flatten(input => ex.value:always_filter:filters) aff  ;;

  dimension: always_filter_pk {
    group_label: "Always Filters"
    label: "Always Filter PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${field_name} '-' || ${field_value} ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Always Filters"
    label: "Field Name"
    type: string
    sql: aff.value:field::varchar ;;
  }

  dimension: field_value {
    group_label: "Always Filters"
    label: "Field Value"
    type: string
    sql: aff.value:value::varchar ;;
  }

  measure: count {
    label: "Number of Always Filters"
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
