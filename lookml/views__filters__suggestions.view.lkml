view: views__filters__suggestions {
  view_label: "Filters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.filters::variant as filters,
#                   f.value::variant as filter,
#                   f.value:name::varchar as filter_name,
#                   f.value:suggestions::variant as suggestions,
#                   fsug.value::varchar as value
#           from lookml.views v
#           , lateral flatten(input => v.filters) f
#           , lateral flatten(input => f.value:suggestions) fsug ;;

  dimension: suggestions_pk {
    group_label: "Suggest"
    label: "Suggestions PK"
    type: string
    primary_key: yes
    sql: ${views__filters.filter_pk} || '-' || ${value}  ;;
    hidden: yes
  }

  dimension: value {
    group_label: "Suggest"
    label: "Suggestion Value"
    type: string
    sql: fsug.value::varchar ;;
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
      views__filters.name,
      value
    ]
  }
}
