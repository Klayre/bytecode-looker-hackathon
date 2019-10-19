view: views__parameters__required_access_grants {
  view_label: "Parameters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.parameters::variant as parameters,
#                   p.value::variant as parameter,
#                   p.value:name::varchar as parameter_name,
#                   p.value:required_access_grants::variant as required_access_grants,
#                   prag.value::varchar as access_grant
#           from lookml.views v
#           , lateral flatten(input => v.parameters) p
#           , lateral flatten(input => p.value:required_access_grants) prag ;;

  dimension: required_access_grants_pk {
    group_label: "Required Access Grants"
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${views__parameters.parameter_pk} || '-' || ${access_grant}  ;;
    hidden: yes
  }

  dimension: access_grant {
    group_label: "Required Access Grants"
    label: "Access Grant"
    type: string
    sql: prag.value::varchar ;;
  }

  measure: count {
    label: "Number of Required Access Grants"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__parameters.name,
      access_grant
    ]
  }
}
