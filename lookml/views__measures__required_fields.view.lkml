view: views__measures__required_fields {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:required_fields::variant as required_fields,
#                   mrf.value::varchar as field_name
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => f.value:required_fields) mrf ;;

  dimension: required_fields_pk {
    group_label: "Required Fields"
    label: "Required Fields PK"
    type: string
    primary_key: yes
    sql: ${views__measures.measure_pk} || '-' || ${field_name}  ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Required Fields"
    label: "Field Name"
    type: string
    sql: mrf.value::varchar ;;
  }

  measure: count {
    label: "Number of Required Fields"
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
