view: views__measures__actions__form_params {
  view_label: "Measures"
#   sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:actions::variant as actions,
#                   mact.value:form_params::variant as form_params,
#                   mactfp.value:"default"::varchar as "default",
#                   mactfp.value:label::varchar as label,
#                   mactfp.value:name::varchar as name,
#                   mactfp.value:options::variant as options,
#                   mactfp.value:required::varchar as required,
#                   mactfp.value:"type"::varchar as "type"
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => m.value:actions) mact
#           , lateral flatten(input => mact.value:form_params) mactfp ;;

    dimension: form_params_pk {
      group_label: "Actions: Form Params"
      label: "Form Params PK"
      type: string
      primary_key: yes
      sql: ${views__measures__actions.actions_pk} || '-' || ${name} ;;
      hidden: yes
    }

    dimension: default {
      group_label: "Actions: Form Params"
      label: "Default"
      type: string
      sql: mactfp.value:"default"::varchar ;;
    }

    dimension: label {
      group_label: "Actions: Form Params"
      label: "Label"
      type: string
      sql: mactfp.value:label::varchar ;;
    }

    dimension: name {
      group_label: "Actions: Form Params"
      label: "Form Param Name"
      type: string
      sql: mactfp.value:name::varchar ;;
    }

    dimension: options {
      group_label: "Actions: Form Params"
      label: "Options JSON"
      type: string
      sql: mactfp.value:options::variant ;;
      hidden: yes
    }

    dimension: required {
      group_label: "Actions: Form Params"
      label: "Required"
      type: string
      sql: mactfp.value:required::varchar ;;
    }

    dimension: required_yn {
      group_label: "Actions: Form Params"
      label: "Is Required"
      type: yesno
      sql: mactfp.value:required::varchar = 'yes' ;;
    }

    dimension: type {
      group_label: "Actions: Form Params"
      label: "Type"
      type: string
      sql: mactfp.value:"type"::varchar ;;
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
        views__measures.name,
        views__measures__actions.label,
        name,
        label,
        type,
        required,
        default
      ]
    }
  }
