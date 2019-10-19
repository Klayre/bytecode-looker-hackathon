view: views__measures__actions__user_attribute_params {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:actions::variant as actions,
#                   mact.value:user_attribute_params::variant as user_attribute_params,
#                   mactuap.value:label::varchar as label,
#                   mactuap.value:name::varchar as name
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => d.value:actions) mact
#           , lateral flatten(input => mact.value:params) mactuap ;;

  dimension: user_attr_params_pk {
    group_label: "Actions: User Attr Params"
    label: "User Attr Params PK"
    type: string
    primary_key: yes
    sql: ${views__measures__actions.actions_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: label {
    group_label: "Actions: User Attr Params"
    label: "Label"
    type: string
    sql: mactp.value:label::varchar ;;
  }

  dimension: name {
    group_label: "Actions: User Attr Params"
    label: "User Attr Param Name"
    type: string
    sql: mactp.value:name::varchar ;;
  }

  measure: count {
    label: "Number of Action User Attr Params"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__measures.name,
      views__measures__actions.label,
      name,
      label
    ]
  }
}
