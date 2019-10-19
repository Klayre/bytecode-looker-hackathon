view: views__dimensions__actions__form_params {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:actions::variant as actions,
#                   dact.value:form_params::variant as form_params,
#                   dactfp.value:"default"::varchar as "default",
#                   dactfp.value:label::varchar as label,
#                   dactfp.value:name::varchar as name,
#                   dactfp.value:options::variant as options,
#                   dactfp.value:required::varchar as required,
#                   dactfp.value:"type"::varchar as "type"
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:actions) dact
#           , lateral flatten(input => dact.value:form_params) dactfp ;;

  dimension: form_params_pk {
    group_label: "Actions: Form Params"
    label: "Form Params PK"
    type: string
    primary_key: yes
    sql: ${views__dimensions__actions.actions_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: default {
    group_label: "Actions: Form Params"
    label: "Default"
    type: string
    sql: dactfp.value:"default"::varchar ;;
  }

  dimension: label {
    group_label: "Actions: Form Params"
    label: "Form Param Label"
    type: string
    sql: dactfp.value:label::varchar ;;
  }

  dimension: name {
    group_label: "Actions: Form Params"
    label: "Form Param Name"
    type: string
    sql: dactfp.value:name::varchar ;;
  }

  dimension: options {
    group_label: "Actions: Form Params"
    label: "Options JSON"
    type: string
    sql: dactfp.value:options::variant ;;
    hidden: yes
  }

  dimension: required {
    group_label: "Actions: Form Params"
    label: "Required"
    type: string
    sql: dactfp.value:required::varchar ;;
  }

  dimension: required_yn {
    group_label: "Actions: Form Params"
    label: "Is Required"
    type: yesno
    sql: dactfp.value:required::varchar = 'yes' ;;
  }

  dimension: type {
    group_label: "Actions: Form Params"
    label: "Type"
    type: string
    sql: dactfp.value:"type"::varchar ;;
  }

  measure: count {
    label: "Number of Action Form Params"
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
      label,
      type,
      required,
      default
    ]
  }
}
