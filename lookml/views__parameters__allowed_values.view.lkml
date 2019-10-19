view: views__parameters__allowed_values {
  view_label: "Parameters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.parameters::variant as parameters,
#                   p.value::variant as parameter,
#                   p.value:name::varchar as parameter_name,
#                   p.value:allowed_values::variant as allowed_values,
#                   pav.value:label::varchar as label,
#                   pav.value:value::varchar as value
#           from lookml.views v
#           , lateral flatten(input => v.parameters) p
#           , lateral flatten(input => p.value:allowed_values) pav ;;

  dimension: allowed_values_pk {
    group_label: "Allowed Values"
    label: "Allowed Values PK"
    type: string
    primary_key: yes
    sql: ${views__parameters.parameter_pk} || '-' || ${label} || '-' || ${value} ;;
    hidden: yes
  }

  dimension: label {
    group_label: "Allowed Values"
    label: "Allowed Value Label"
    type: string
    sql: pav.value:label::varchar ;;
  }

  dimension: value {
    group_label: "Allowed Values"
    label: "Allowed Value"
    type: string
    sql: pav.value:value::varchar ;;
  }

  measure: count {
    label: "Number of Allowed Values"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__parameters.name,
      label,
      value
    ]
  }
}
