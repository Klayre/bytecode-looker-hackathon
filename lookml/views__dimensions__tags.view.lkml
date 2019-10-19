view: views__dimensions__tags {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:tags::variant as tags,
#                   dtag.value::varchar as tag
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:tags) dtag ;;

  dimension: tags_pk {
    group_label: "Tags"
    label: "Tags PK"
    type: string
    primary_key: yes
    sql: ${views__dimensions.dimension_pk} || '-' || ${tag}  ;;
    hidden: yes
  }

  dimension: tag {
    group_label: "Tags"
    label: "Tag"
    type: string
    sql: dtag.value::varchar ;;
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
      views__dimensions.name,
      tag
    ]
  }
}
