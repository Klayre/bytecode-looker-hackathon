view: views__parameters__suggestions {
  view_label: "Parameters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.parameters::variant as parameters,
#                   p.value::variant as parameter,
#                   p.value:name::varchar as parameter_name,
#                   p.value:suggestions::variant as suggestions,
#                   psug.value::varchar as value
#           from lookml.views v
#           , lateral flatten(input => v.parameters) p
#           , lateral flatten(input => p.value:suggestions) psug ;;

  dimension: suggestions_pk {
    group_label: "Suggest"
    label: "Suggestions PK"
    type: string
    primary_key: yes
    sql: ${views__parameters.parameter_pk} || '-' || ${value}  ;;
    hidden: yes
  }

  dimension: value {
    group_label: "Suggest"
    label: "Suggestion Value"
    type: string
    sql: psug.value::varchar ;;
  }

  measure: count {
    label: "Number of Suggestion Values"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__parameters.name,
      value
    ]
  }
}
