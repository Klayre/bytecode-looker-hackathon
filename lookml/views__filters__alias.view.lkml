view: views__filters__alias {
  view_label: "Filters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.filters::variant as filters,
#                   f.value::variant as filter,
#                   f.value:name::varchar as filter_name,
#                   f.value:alias::variant as alias_list,
#                   fals.value::varchar as alias
#           from lookml.views v
#           , lateral flatten(input => v.filters) f
#           , lateral flatten(input => f.value:alias) fals ;;

  dimension: alias_pk {
    group_label: "Aliases"
    label: "Alias PK"
    type: string
    primary_key: yes
    sql: ${views__filters.filter_pk} || '-' || ${alias}  ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Alias"
    type: string
    sql: fals.value::varchar ;;
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
      views__filters.name,
      alias
    ]
  }
}
