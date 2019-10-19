view: views__dimensions__actions__params {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_ame,
#                   d.value:actions::variant as actions,
#                   dact.value:params::variant as params,
#                   dactp.value:label::varchar as label,
#                   dactp.value:name::varchar as name
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:actions) dact
#           , lateral flatten(input => dact.value:params) dactp ;;

  dimension: params_pk {
    group_label: "Actions: Params"
    label: "Params PK"
    type: string
    primary_key: yes
    sql: ${views__dimensions__actions.actions_pk} || '-' || ${name} ;;
    hidden: yes
  }


  dimension: label {
    group_label: "Actions: Params"
    label: "Param Label"
    type: string
    sql: dactp.value:label::varchar ;;
  }

  dimension: name {
    group_label: "Actions: Params"
    label: "Param Name"
    type: string
    sql: dactp.value:name::varchar ;;
  }

  measure: count {
    label: "Number of Action Params"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__dimensions.name,
      views__dimensions__actions.label,
      name,
      label
    ]
  }
}
