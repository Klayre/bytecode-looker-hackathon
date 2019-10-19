view: views__dimensions__suggestions {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:suggestions::variant as suggestions,
#                   dsug.value::varchar as value
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:suggestions) dsug ;;

  dimension: suggestions_pk {
    group_label: "Suggest"
    label: "Suggestions PK"
    type: string
    primary_key: yes
    sql: ${views__dimensions.dimension_pk} || '-' || ${value}  ;;
    hidden: yes
  }

  dimension: value {
    group_label: "Suggest"
    label: "Suggestion Value"
    type: string
    sql: dsug.value::varchar ;;
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
      views__dimensions.name,
      value
    ]
  }
}
