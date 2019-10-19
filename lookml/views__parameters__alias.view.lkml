view: views__parameters__alias {
  view_label: "Parameters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.parameters::variant as parameters,
#                   p.value::variant as parameter,
#                   p.value:name::varchar as parameter_name,
#                   p.value:alias::variant as alias_list,
#                   pals.value::varchar as alias
#           from lookml.views v
#           , lateral flatten(input => v.parameters) p
#           , lateral flatten(input => p.value:alias) pals ;;

  dimension: alias_pk {
    group_label: "Aliases"
    label: "Alias PK"
    type: string
    primary_key: yes
    sql: ${views__parameters.parameter_pk} || '-' || ${alias}  ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Alias"
    type: string
    sql: pals.value::varchar ;;
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
      views__parameters.name,
      alias
    ]
  }
}
