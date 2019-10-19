view: models__access_grants {
  view_label: "Models"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ag.value:name::varchar as name,
#                   ag.value:user_attribute::varchar as user_attribute,
#                   agv.value::varchar as allowed_value
#           from lookml.models m
#           , lateral flatten(input => m.access_grants) ag
#           , lateral flatten(input => ag.value:allowed_values) agv ;;

  dimension: access_grant_value_pk {
    group_label: "Access Grants"
    label: "Access Grant Value PK"
    type: string
    primary_key: yes
    sql: ${models.model_pk}  || '-' ${name} || '-' || ${user_attribute} || '-' || ${allowed_value} ;;
    hidden: yes
  }

  dimension: access_grant_key {
    group_label: "Access Grants"
    label: "Access Grant Key"
    type: string
    sql: ${models.model_pk}  || '-' ${name} ;;
    hidden: yes
  }

  dimension: allowed_value {
    group_label: "Access Grants"
    label: "Allowed Value"
    type: string
    sql: agv.value::varchar ;;
  }

  dimension: name {
    group_label: "Access Grants"
    label: "Access Grant Name"
    type: string
    sql: ag.value:name::varchar ;;
  }

  dimension: user_attribute {
    group_label: "Access Grants"
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
