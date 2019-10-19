view: views__parameters {
  view_label: "Parameters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.parameters::variant as parameters,
#                   p.value::variant as parameter,
#                   p.value:alias::variant as alias,
#                   p.value:allowed_values::variant as allowed_values,
#                   p.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
#                   p.value:convert_tz::varchar as convert_tz,
#                   p.value:default_value::varchar as default_value,
#                   p.value:description::varchar as description,
#                   p.value:full_suggestions::varchar as full_suggestions,
#                   p.value:hidden::varchar as hidden,
#                   p.value:label::varchar as label,
#                   p.value:name::varchar as name,
#                   p.value:required_access_grants::variant as required_access_grants,
#                   p.value:required_fields::variant as required_fields,
#                   p.value:suggest_dimension::varchar as suggest_dimension,
#                   p.value:suggest_explore::varchar as suggest_explore,
#                   p.value:suggest_persist_for::varchar as suggest_persist_for,
#                   p.value:suggestable::varchar as suggestable,
#                   p.value:suggestions::variant as suggestions,
#                   p.value:tags::variant as tags,
#                   p.value:"type"::varchar as "type",
#                   p.value:view_label::varchar as view_label
#           from lookml.views v
#           , lateral flatten(input => v.parameters) p ;;

  dimension: parameter_pk {
    label: "Parameter PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Aliases JSON"
    type: string
    sql: p.value:alias::variant  ;;
    hidden: yes
  }

  dimension: alias_list {
    group_label: "Aliases"
    label: "Aliases List"
    type: string
    sql: array_to_string(parse_json(${alias}), ', ') ;;
  }

  dimension: allowed_values {
    group_label: "Allowed Values"
    label: "Allowed Values JSON"
    type: string
    sql: p.value:allowed_values::variant  ;;
    hidden: yes
  }

  dimension: bypass_suggest_restrictions {
    group_label: "Suggest"
    label: "Bypass Suggest Restrictions"
    type: string
    sql: p.value:bypass_suggest_restrictions::varchar ;;
  }

  dimension: bypass_suggest_restrictions_yn {
    group_label: "YesNo"
    label: "Bypass Suggest Restrictions"
    type: yesno
    sql: ${bypass_suggest_restrictions} = 'yes' ;;
  }

  dimension: convert_tz {
    label: "Convert Timezone"
    type: string
    sql: p.value:convert_tz::varchar ;;
  }

  dimension: convert_tz_yn {
    group_label: "YesNo"
    label: "Convert Timezone"
    type: yesno
    sql: ${convert_tz} = 'yes' ;;
  }

  dimension: default_value {
    label: "Default Value"
    type: string
    sql: p.value:default_value::varchar ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: p.value:description::varchar ;;
  }

  dimension: full_suggestions {
    group_label: "Suggest"
    label: "Full Suggestions"
    type: string
    sql: p.value:full_suggestions::varchar ;;
  }

  dimension: full_suggestions_yn {
    group_label: "YesNo"
    label: "Full Suggestions"
    type: yesno
    sql: ${full_suggestions} = 'yes' ;;
  }

  dimension: hidden {
    label: "Hidden"
    type: string
    sql: p.value:hidden::varchar ;;
  }

  dimension: hidden_yn {
    group_label: "YesNo"
    label: "Hidden"
    type: yesno
    sql: ${hidden} = 'yes' ;;
  }

  dimension: label {
    label: "Label"
    type: string
    sql: p.value:label::varchar ;;
  }

  dimension: name {
    label: "Parameter Name"
    type: string
    sql: p.value:name::varchar ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants JSON"
    type: string
    sql: p.value:required_access_grants::variant ;;
    hidden: yes
  }

  dimension: required_access_grants_list {
    group_label: "Required Access Grants"
    label: "Required Access Grants List"
    type: string
    sql: array_to_string(parse_json(${required_access_grants}), ', ') ;;
  }

  dimension: required_fields {
    group_label: "Required Fields"
    label: "Required Fields"
    type: string
    sql: p.value:required_fields::variant ;;
    hidden: yes
  }

  dimension: required_fields_list {
    group_label: "Required Fields"
    label: "Required Fields List"
    type: string
    sql: array_to_string(parse_json(${required_fields}), ', ') ;;
  }

  dimension: suggest_dimension {
    group_label: "Suggest"
    label: "Suggest Dimension"
    type: string
    sql: p.value:suggest_dimension::varchar ;;
  }

  dimension: suggest_explore {
    group_label: "Suggest"
    label: "Suggest Explore"
    type: string
    sql: p.value:suggest_explore::varchar  ;;
  }

  dimension: suggest_persist_for {
    group_label: "Suggest"
    label: "Suggest Persist For"
    type: string
    sql: p.value:suggest_persist_for::varchar  ;;
  }

  dimension: suggestable {
    group_label: "Suggest"
    label: "Suggestable"
    type: string
    sql: p.value:suggestable::varchar  ;;
  }

  dimension: suggestions {
    group_label: "Suggest"
    label: "Suggestions JSON"
    type: string
    sql: p.value:suggestions::variant ;;
    hidden: yes
  }

  dimension: suggestions_list {
    group_label: "Suggest"
    label: "Suggestions List"
    type: string
    sql: array_to_string(parse_json(${suggestions}), ', ') ;;
  }

  dimension: tags {
    group_label: "Tags"
    label: "Tags JSON"
    type: string
    sql: p.value:tags::variant ;;
    hidden: yes
  }

  dimension: tags_list {
    group_label: "Tags"
    label: "Tags List"
    type: string
    sql: array_to_string(parse_json(${tags}), ', ') ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: p.value:"type"::varchar ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: p.value:view_label::varchar ;;
  }

  measure: count {
    label: "Number of Parameters"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      name,
      description,
      label,
      type,
      hidden,
      default_value
    ]
  }
}
