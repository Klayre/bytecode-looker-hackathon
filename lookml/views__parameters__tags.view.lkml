view: views__parameters__tags {
  view_label: "Parameters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.parameters::variant as parameters,
#                   p.value::variant as parameter,
#                   p.value:name::varchar as parameter_name,
#                   p.value:tags::variant as tags,
#                   ptag.value::varchar as tag
#           from lookml.views v
#           , lateral flatten(input => v.parameters) p
#           , lateral flatten(input => p.value:tags) ptag ;;

  dimension: tags_pk {
    group_label: "Tags"
    label: "Tags PK"
    type: string
    primary_key: yes
    sql: ${views__parameters.parameter_pk} || '-' || ${tag}  ;;
    hidden: yes
  }

  dimension: tag {
    group_label: "Tags"
    label: "Tag"
    type: string
    sql: ptag.value::varchar ;;
  }

  measure: count {
    label: "Number of Tags"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__parameters.name,
      tag
    ]
  }
}
