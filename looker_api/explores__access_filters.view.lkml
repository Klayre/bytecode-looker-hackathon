view: explores__access_filters {
  view_label: "Explores"
#     sql:  select  ex.id as explore_id,
#                   ex.name as explore_name,
#                   ex.access_filters,
#                   af.value:field::varchar as field_name,
#                   af.value:user_attribute::varchar as user_attribute
#           from looker.explores ex
#           , lateral flatten(input => ex.access_filters) af ;;

  dimension: access_filter_pk {
    group_label: "Access Filters"
    label: "Access Filter PK"
    type: string
    primary_key: yes
    sql: ${explores.id} || '-' || ${field_name} || '-' || ${user_attribute} ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Access Filters"
    label: "Field Name"
    type: string
    sql: af.value:field::varchar ;;
  }

  dimension: user_attribute {
    group_label: "Access Filters"
    label: "User Attribute"
    type: string
    sql: af.value:field::varchar ;;
  }

  measure: count {
    label: "Number of Access Filters"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      explores.id,
      explores.name,
      field_name,
      user_attribute
    ]
  }

}
