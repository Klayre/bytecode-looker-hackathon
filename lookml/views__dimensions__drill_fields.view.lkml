view: views__dimensions__drill_fields {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:drill_fields::variant as drill_fields,
#                   ddf.value::varchar as field_name
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:drill_fields) ddf ;;

  dimension: drill_fields_pk {
    group_label: "Drill Fields"
    label: "Drill Fields PK"
    type: string
    primary_key: yes
    sql: ${views__dimensions.dimension_pk} || '-' || ${field_name}  ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Drill Fields"
    label: "Field Name"
    type: string
    sql: ddf.value::varchar ;;
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
      views__dimensions.name,
      field_name
    ]
  }
}
