view: models__access_grants {
  view_label: "Access Grants"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ag.value:name::varchar as name,
#                   ag.value:user_attribute::varchar as user_attribute,
#                   agv.value::varchar as allowed_value
#           from lookml.models m
#           , lateral flatten(input => m.access_grants) ag
#           , lateral flatten(input => ag.value:allowed_values) agv ;;

  dimension: access_grant_value_pk {
    label: "Access Grant Value PK"
    type: string
    primary_key: yes
    sql: ${models.sha} || '-' || ${models.path} || '-' ${name} || '-' || ${user_attribute} || '-' || ${allowed_value} ;;
    hidden: yes
  }

  dimension: access_grant_key {
    label: "Access Grant Key"
    type: string
    sql: ${models.sha} || '-' || ${models.path} || '-' ${name} ;;
    hidden: yes
  }

  dimension: allowed_value {
    label: "Allowed Value"
    type: string
    sql: agv.value::varchar ;;
  }

  dimension: name {
    label: "Access Grant Name"
    type: string
    sql: ag.value:name::varchar ;;
  }

  dimension: user_attribute {
    label: "User Attribute"
    type: string
    sql: ag.value:user_attribute::varchar ;;
  }

  measure: count {
    label: "Number of Access Grant Values"
    type: count
    drill_fields: [detail*]
  }

  measure: count_access_grant {
    label: "Number of Access Grants"
    type: count_distinct
    sql: ${access_grant_key} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      name,
      allowed_value,
      user_attribute
    ]
  }

}
