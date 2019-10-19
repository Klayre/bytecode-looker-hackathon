view: views__measures__drill_fields {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:drill_fields::variant as drill_fields,
#                   mdf.value::varchar as field_name
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => m.value:drill_fields) mdf ;;

  dimension: drill_fields_pk {
    group_label: "Drill Fields"
    label: "Drill Fields PK"
    type: string
    primary_key: yes
    sql: ${views__measures.measure_pk} || '-' || ${field_name}  ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Drill Fields"
    label: "Field Name"
    type: string
    sql: mdf.value::varchar ;;
  }

  measure: count {
    label: "Number of Drill Fields"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__measures.name,
      field_name
    ]
  }
}
