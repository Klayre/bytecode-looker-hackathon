view: views__measures__required_access_grants {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:required_access_grants::variant as required_access_grants,
#                   mrag.value::varchar as access_grant
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => p.value:required_access_grants) mrag ;;

  dimension: required_access_grants_pk {
    group_label: "Required Access Grants"
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${views__measures.measure_pk} || '-' || ${access_grant}  ;;
    hidden: yes
  }

  dimension: access_grant {
    group_label: "Required Access Grants"
    label: "Access Grant"
    type: string
    sql: mrag.value::varchar ;;
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
      views__measures.name,
      access_grant
    ]
  }
}
