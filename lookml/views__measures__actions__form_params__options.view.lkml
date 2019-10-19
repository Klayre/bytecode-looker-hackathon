view: views__measures__actions__form_params__options {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::varchar as measure,
#                   m.value:name::varchar as dimension_name,
#                   m.value:actions::variant as actions,
#                   mact.value:form_params::variant as form_params,
#                   mactfp.value:name::varchar as form_param_name,
#                   mactfp.value:options::variant as options,
#                   mactfpo.value:label::varchar as label,
#                   mactfpo.value:name::varchar as name
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => m.value:actions) mact
#           , lateral flatten(input => mact.value:form_params) mactfp
#           , lateral flatten(input => mactfp.value:options) mactfpo ;;

  dimension: options_pk {
    group_label: "Actions: Form Params"
    label: "Options PK"
    type: string
    primary_key: yes
    sql: ${views__measures__actions__form_params.form_params_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: label {
    group_label: "Actions: Form Params"
    label: "Option Label"
    type: string
    sql: mactfpo.value:label::varchar ;;
  }

  dimension: name {
    group_label: "Actions: Form Params"
    label: "Option Name"
    type: string
    sql: mactfpo.value:name::varchar ;;
  }

  dimension: options {
    group_label: "Actions: Form Params"
    label: "Options JSON"
    type: string
    sql: mact.value:options::variant ;;
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
      views__measures.name,
      views__measures__actions.label,
      views__measures__actions__form_params.name,
      name,
      label
    ]
  }
}
