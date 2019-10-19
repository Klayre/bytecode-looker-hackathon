view: views__filters__required_fields {
  view_label: "Filters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.filters::variant as filters,
#                   f.value::variant as filter,
#                   f.value:name::varchar as filter_name,
#                   f.value:required_fields::variant as required_fields,
#                   frf.value::varchar as field_name
#           from lookml.views v
#           , lateral flatten(input => v.filters) f
#           , lateral flatten(input => f.value:required_fields) frf ;;

  dimension: required_fields_pk {
    group_label: "Required Fields"
    label: "Required Fields PK"
    type: string
    primary_key: yes
    sql: ${views__filters.filter_pk} || '-' || ${field_name}  ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Required Fields"
    label: "Field Name"
    type: string
    sql: frf.value::varchar ;;
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
      views__filters.name,
      field_name
    ]
  }
}
