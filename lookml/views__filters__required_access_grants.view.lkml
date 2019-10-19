view: views__filters__required_access_grants {
  view_label: "Filters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.filters::variant as filters,
#                   f.value::variant as filter,
#                   f.value:name::varchar as filter_name,
#                   f.value:required_access_grants::variant as required_access_grants,
#                   frag.value::varchar as access_grant
#           from lookml.views v
#           , lateral flatten(input => v.filters) f
#           , lateral flatten(input => f.value:required_access_grants) frag ;;

  dimension: required_access_grants_pk {
    group_label: "Required Access Grants"
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${views__filters.filter_pk} || '-' || ${access_grant}  ;;
    hidden: yes
  }

  dimension: access_grant {
    group_label: "Required Access Grants"
    label: "Access Grant"
    type: string
    sql: frag.value::varchar ;;
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
      views__filters.name,
      access_grant
    ]
  }
}
