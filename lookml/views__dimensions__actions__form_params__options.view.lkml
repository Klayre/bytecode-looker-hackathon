view: views__dimensions__actions__form_params__options {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::varchar as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:actions::variant as actions,
#                   dact.value:form_params::variant as form_params,
#                   dactfp.value:name::varchar as form_param_name,
#                   dactfp.value:options::variant as options,
#                   dactfpo.value:label::varchar as label,
#                   dactfpo.value:name::varchar as name
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:actions) dact
#           , lateral flatten(input => dact.value:form_params) dactfp
#           , lateral flatten(input => dactfp.value:options) dactfpo ;;

  dimension: options_pk {
    group_label: "Actions: Form Params"
    label: "Options PK"
    type: string
    primary_key: yes
    sql: ${views__dimensions__actions__form_params.form_params_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: label {
    group_label: "Actions: Form Params"
    label: "Option Label"
    type: string
    sql: dactfpo.value:label::varchar ;;
  }

  dimension: name {
    group_label: "Actions: Form Params"
    label: "Option Name"
    type: string
    sql: dactfpo.value:name::varchar ;;
  }

  dimension: options {
    group_label: "Actions: Form Params"
    label: "Options JSON"
    type: string
    sql: dact.value:options::variant ;;
    hidden: yes
  }

  measure: count {
    label: "Number of Action Form Params Options"
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
      views__dimensions__actions__form_params.name,
      name,
      label
    ]
  }
}
