view: explores__conditionally_filters {
  view_label: "Explores"
#     sql:  select  ex.id as explore_id,
#                   ex.name as explore_name,
#                   cff.value:field::varchar as field_name,
#                   cff.value:value::varchar as field_value
#           from looker.explores ex
#           , lateral flatten(input => ex.conditionally_filter:filters) cff ;;

  dimension: conditionally_filters_pk {
    group_label: "Conditionally Filters"
    label: "Conditionally Filters PK"
    type: string
    primary_key: yes
    sql: ${explores.id} || '-' || ${field_name} || '-' ${filter_value} ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Conditionally Filters"
    label: "Field Name"
    type: string
    sql: cff.value:field::varchar ;;
  }

  dimension: filter_value {
    group_label: "Conditionally Filters"
    label: "Filter Value"
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
      explores.id,
      explores.name,
      field_name,
      filter_value
    ]
  }

}
