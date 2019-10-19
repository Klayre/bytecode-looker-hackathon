view: views__dimension_groups__drill_fields {
  view_label: "Dimension Groups"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimension_groups,
#                   dg.value::variant as dimension_group,
#                   dg.value:name::varchar as dimension_group_name,
#                   dg.value:drill_fields::variant as drill_fields,
#                   dgdf.value::varchar as field_name
#           from lookml.views v
#           , lateral flatten(input => v.dimension_groups) dg
#           , lateral flatten(input => dg.value:drill_fields) dgdf ;;

  dimension: drill_fields_pk {
    group_label: "Drill Fields"
    label: "Drill Fields PK"
    type: string
    primary_key: yes
    sql: ${views__dimension_groups.dimension_group_pk} || '-' || ${field_name}  ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Drill Fields"
    label: "Field Name"
    type: string
    sql: dgdf.value::varchar ;;
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
      views__dimension_groups.name,
      field_name
    ]
  }
}
