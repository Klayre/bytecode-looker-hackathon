view: views__dimension_groups__tags {
  view_label: "Dimension Groups"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimension_groups,
#                   dg.value::variant as dimension_group,
#                   dg.value:name::varchar as dimension_group_name,
#                   dg.value:tags::variant as tags,
#                   dgtag.value::varchar as tag
#           from lookml.views v
#           , lateral flatten(input => v.dimension_groups) dg
#           , lateral flatten(input => dg.value:tags) dgtag ;;

  dimension: tags_pk {
    group_label: "Tags"
    label: "Tags PK"
    type: string
    primary_key: yes
    sql: ${views__dimension_groups.dimension_group_pk} || '-' || ${tag}  ;;
    hidden: yes
  }

  dimension: tag {
    group_label: "Tags"
    label: "Tag"
    type: string
    sql: dgtag.value::varchar ;;
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
      views__dimension_groups.name,
      tag
    ]
  }
}
