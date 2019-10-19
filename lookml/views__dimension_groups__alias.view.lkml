view: views__dimension_groups__alias {
  view_label: "Dimension Groups"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimension_groups,
#                   dg.value::variant as dimension_group,
#                   dg.value:name::varchar as dimension_group_name,
#                   dg.value:alias::variant as alias_list,
#                   dgals.value::varchar as alias
#           from lookml.views v
#           , lateral flatten(input => v.dimension_groups) dg
#           , lateral flatten(input => dg.value:alias) dgals ;;

  dimension: alias_pk {
    group_label: "Aliases"
    label: "Alias PK"
    type: string
    primary_key: yes
    sql: ${views__dimension_groups.dimension_group_pk} || '-' || ${alias}  ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Alias"
    type: string
    sql: dgals.value::varchar ;;
  }

  measure: count {
    label: "Number of Aliases"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__dimension_groups.name,
      alias
    ]
  }
}
