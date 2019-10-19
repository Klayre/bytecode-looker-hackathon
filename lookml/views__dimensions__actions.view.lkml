view: views__dimensions__actions {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:actions::variant as actions,
#                   dact.value:form_params::variant as form_params,
#                   dact.value:form_url::varchar as form_url,
#                   dact.value:icon_url::varchar as icon_url,
#                   dact.value:label::varchar as label,
#                   dact.value:params::variant as params,
#                   dact.value:url::varchar as url,
#                   dact.value:user_attribute_params::variant as user_attribute_params
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:actions) dact  ;;

  dimension: actions_pk {
    group_label: "Actions"
    label: "Actions PK"
    type: string
    primary_key: yes
    sql: MD5(${views__dimensions.dimension_pk} || '-' || ${label} || '-' || ${url}) ;;
    hidden: yes
  }

  dimension: form_params {
    group_label: "Actions: Form Params"
    label: "Form Params JSON"
    type: string
    sql: dact.value:form_params::variant ;;
    hidden: yes
  }

  dimension: form_url {
    group_label: "Actions"
    label: "Form URL"
    type: string
    sql: dact.value:form_url::varchar ;;
  }

  dimension: icon_url {
    group_label: "Actions"
    label: "Icon URL"
    type: string
    sql: dact.value:icon_url::varchar ;;
  }

  dimension: label {
    group_label: "Actions"
    label: "Label"
    type: string
    sql: dact.value:label::varchar ;;
  }

  dimension: params {
    group_label: "Actions: Params"
    label: "Params JSON"
    type: string
    sql: dact.value:params::variant ;;
    hidden: yes
  }

  dimension: url {
    group_label: "Actions"
    label: "URL"
    type: string
    sql: dact.value:url::varchar ;;
  }

  dimension: user_attribute_params {
    group_label: "Actions: User Attr Params"
    label: "User Attribute Params JSON"
    type: string
    sql: dact.value:user_attribute_params::variant ;;
    hidden: yes
  }

  measure: count {
    label: "Number of Actions"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__dimensions.name,
      label,
      url
    ]
  }
}
