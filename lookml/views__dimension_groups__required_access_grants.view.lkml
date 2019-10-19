view: views__dimension_groups__required_access_grants {
  view_label: "Dimension Groups"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimension_groups,
#                   dg.value::variant as dimension_group,
#                   dg.value:name::varchar as dimension_group_name,
#                   dg.value:required_access_grants::variant as required_access_grants,
#                   dgrag.value::varchar as access_grant
#           from lookml.views v
#           , lateral flatten(input => v.dimension_groups) dg
#           , lateral flatten(input => dg.value:required_access_grants) dgrag ;;

  dimension: required_access_grants_pk {
    group_label: "Required Access Grants"
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${views__dimension_groups.dimension_group_pk} || '-' || ${access_grant}  ;;
    hidden: yes
  }

  dimension: access_grant {
    group_label: "Required Access Grants"
    label: "Access Grant"
    type: string
    sql: dgrag.value::varchar ;;
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
      views__dimension_groups.name,
      access_grant
    ]
  }
}
