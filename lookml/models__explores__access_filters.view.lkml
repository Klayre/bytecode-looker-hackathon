view: models__explores__access_filters {
  view_label: "Explores"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ex.value:name::varchar as explore_name,
#                   af.value:field::varchar as field_name,
#                   af.value:user_attribute::varchar as user_attribute
#           from lookml.models m
#           , lateral flatten(input => m.explores) ex
#           , lateral flatten(input => ex.value:access_filters) af ;;

  dimension: access_filter_pk {
    group_label: "Access Filters"
    label: "Access Filter PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${field_name} '-' || ${user_attribute} ;;
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
      model_files.model_name,
      models__explores.name,
      field_name,
      user_attribute
    ]
  }

}
