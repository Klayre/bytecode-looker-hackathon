view: views__measures__filters {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:filters::variant as filters,
#                   mf.value:field::varchar as field_name,
#                   mf.value:value::varchar as filter_value
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => m.value:filters) mf ;;

  dimension: filters_pk {
    group_label: "Filters"
    label: "Filters PK"
    type: string
    primary_key: yes
    sql: ${views__measures.measure_pk} || '-' || ${field_name} || '-' || ${filter_value} ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Filters"
    label: "Field Name"
    type: string
    sql: mdf.value:field::varchar ;;
  }

  dimension: filter_value {
    group_label: "Filters"
    label: "Filter Value"
    type: string
    sql: mdf.value:value::varchar ;;
  }

  measure: count {
    label: "Number of Filters"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__measures.name,
      field_name,
      filter_value
    ]
  }
}
