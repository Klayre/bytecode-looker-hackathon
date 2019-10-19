view: views__measures__alias {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:alias::variant as alias_list,
#                   mals.value::varchar as alias
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => m.value:alias) mals ;;

  dimension: alias_pk {
    group_label: "Aliases"
    label: "Alias PK"
    type: string
    primary_key: yes
    sql: ${views__measures.measure_pk} || '-' || ${alias}  ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Alias"
    type: string
    sql: mals.value::varchar ;;
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
      views__measures.name,
      alias
    ]
  }
}
