view: views__parameters__required_fields {
  view_label: "Parameters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.parameters::variant as parameters,
#                   p.value::variant as parameter,
#                   p.value:name::varchar as parameter_name,
#                   p.value:required_fields::variant as required_fields,
#                   prf.value::varchar as field_name
#           from lookml.views v
#           , lateral flatten(input => v.parameters) p
#           , lateral flatten(input => p.value:required_fields) prf ;;

  dimension: required_fields_pk {
    group_label: "Required Fields"
    label: "Required Fields PK"
    type: string
    primary_key: yes
    sql: ${views__parameters.parameter_pk} || '-' || ${field_name}  ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Required Fields"
    label: "Field Name"
    type: string
    sql: prf.value::varchar ;;
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
      views__parameters.name,
      field_name
    ]
  }
}
