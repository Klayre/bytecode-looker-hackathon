view: views__filters__tags {
  view_label: "Filters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.filters::variant as filters,
#                   f.value::variant as filter,
#                   f.value:name::varchar as filter_name,
#                   f.value:tags::variant as tags,
#                   ftag.value::varchar as tag
#           from lookml.views v
#           , lateral flatten(input => v.filters) f
#           , lateral flatten(input => f.value:tags) ftag ;;

  dimension: tags_pk {
    group_label: "Tags"
    label: "Tags PK"
    type: string
    primary_key: yes
    sql: ${views__filters.filter_pk} || '-' || ${tag}  ;;
    hidden: yes
  }

  dimension: tag {
    group_label: "Tags"
    label: "Tag"
    type: string
    sql: ftag.value::varchar ;;
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
      views__filters.name,
      tag
    ]
  }
}
