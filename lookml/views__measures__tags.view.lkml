view: views__measures__tags {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measure::variant as measure,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:tags::variant as tags,
#                   mtag.value::varchar as tag
#           from lookml.views v
#           , lateral flatten(input => v.measure) m
#           , lateral flatten(input => m.value:tags) mtag ;;

  dimension: tags_pk {
    group_label: "Tags"
    label: "Tags PK"
    type: string
    primary_key: yes
    sql: ${views__measures.measure_pk} || '-' || ${tag}  ;;
    hidden: yes
  }

  dimension: tag {
    group_label: "Tags"
    label: "Tag"
    type: string
    sql: mtag.value::varchar ;;
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
      views__measure.name,
      tag
    ]
  }
}
