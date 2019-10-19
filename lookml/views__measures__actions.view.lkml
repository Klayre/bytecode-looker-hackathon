view: views__measures__actions {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:actions::variant as actions,
#                   mact.value:form_params::variant as form_params,
#                   mact.value:form_url::varchar as form_url,
#                   mact.value:icon_url::varchar as icon_url,
#                   mact.value:label::varchar as label,
#                   mact.value:params::variant as params,
#                   mact.value:url::varchar as url,
#                   mact.value:user_attribute_params::variant as user_attribute_params
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => m.value:actions) mact  ;;

  dimension: actions_pk {
    group_label: "Actions"
    label: "Actions PK"
    type: string
    primary_key: yes
    sql: MD5(${views__measures.measure_pk} || '-' || ${label} || '-' || ${url}) ;;
    hidden: yes
  }

  dimension: form_params {
    group_label: "Actions: Form Params"
    label: "Form Params JSON"
    type: string
    sql: mact.value:form_params::variant ;;
    hidden: yes
  }

  dimension: form_url {
    group_label: "Actions"
    label: "Form URL"
    type: string
    sql: mact.value:form_url::varchar ;;
  }

  dimension: icon_url {
    group_label: "Actions"
    label: "Icon URL"
    type: string
    sql: mact.value:icon_url::varchar ;;
  }

  dimension: label {
    group_label: "Actions"
    label: "Label"
    type: string
    sql: mact.value:label::varchar ;;
  }

  dimension: params {
    group_label: "Actions: Params"
    label: "Params JSON"
    type: string
    sql: mact.value:params::variant ;;
    hidden: yes
  }

  dimension: url {
    group_label: "Actions"
    label: "URL"
    type: string
    sql: mact.value:url::varchar ;;
  }

  dimension: user_attribute_params {
    group_label: "Actions: User Attr Params"
    label: "User Attribute Params JSON"
    type: string
    sql: mact.value:user_attribute_params::variant ;;
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
      views__measures.name,
      label,
      url
    ]
  }
}
