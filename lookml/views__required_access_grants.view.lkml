view: views__required_access_grants {
  view_label: "Views"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.required_access_grants::variant as required_access_grants,
#                   vrag.value::varchar as access_grant
#           from lookml.views v
#           , lateral flatten(input => v.value:required_access_grants) vrag ;;

  dimension: required_access_grants_pk {
    group_label: "Required Access Grants"
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${access_grant}  ;;
    hidden: yes
  }

  dimension: access_grant {
    group_label: "Required Access Grants"
    label: "Access Grant"
    type: string
    sql: vrag.value::varchar ;;
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
      access_grant
    ]
  }
}
