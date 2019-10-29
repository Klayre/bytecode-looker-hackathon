view: views__filters {
  view_label: "Filters"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.filters::variant as filters,
#                   f.value::variant as filter,
#                   f.value:alias::variant as alias,
#                   f.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
#                   f.value:case_sensitive::varchar as case_sensitive,
#                   f.value:convert_tz::varchar as convert_tz,
#                   f.value:datatype::varchar as datatype,
#                   f.value:default_value::varchar as default_value,
#                   f.value:description::varchar as description,
#                   f.value:full_suggestions::varchar as full_suggestions,
#                   f.value:group_item_label::varchar as group_item_label,
#                   f.value:group_label::varchar as group_label,
#                   f.value:hidden::varchar as hidden,
#                   COALESCE(f.value:label::varchar, initcap(replace(f.value:name::varchar, '_', ' '))) as label,
#                   f.value:name::varchar as name,
#                   f.value:required_access_grants::variant as required_access_grants,
#                   f.value:required_fields::variant as required_fields,
#                   f.value:sql::varchar as "sql",
#                   f.value:suggest_dimension::varchar as suggest_dimension,
#                   f.value:suggest_explore::varchar as suggest_explore,
#                   f.value:suggest_persist_for::varchar as suggest_persist_for,
#                   f.value:suggestable::varchar as suggestable,
#                   f.value:suggestions::variant as suggestions,
#                   f.value:tags::variant as tags,
#                   f.value:"type"::varchar as "type",
#                   f.value:view_label::varchar as view_label
#           from lookml.views v
#           , lateral flatten(input => v.filters) f ;;

  dimension: filter_pk {
    label: "Filter PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Aliases JSON"
    type: string
    sql: f.value:alias::variant  ;;
    hidden: yes
  }

  dimension: alias_list {
    group_label: "Aliases"
    label: "Aliases List"
    type: string
    sql: array_to_string(parse_json(${alias}), ', ') ;;
  }

  dimension: bypass_suggest_restrictions {
    group_label: "Suggest"
    label: "Bypass Suggest Restrictions"
    type: string
    sql: f.value:bypass_suggest_restrictions::varchar ;;
  }

  dimension: bypass_suggest_restrictions_yn {
    group_label: "YesNo"
    label: "Bypass Suggest Restrictions"
    type: yesno
    sql: ${bypass_suggest_restrictions} = 'yes' ;;
  }

  dimension: case_sensitive {
    label: "Case Sensitive"
    type: string
    sql: f.value:case_sensitive::varchar ;;
  }

  dimension: case_sensitive_yn {
    group_label: "YesNo"
    label: "Case Sensitive"
    type: yesno
    sql: ${case_sensitive} = 'yes' ;;
  }

  dimension: convert_tz {
    label: "Convert Timezone"
    type: string
    sql: f.value:convert_tz::varchar ;;
  }

  dimension: convert_tz_yn {
    group_label: "YesNo"
    label: "Convert Timezone"
    type: yesno
    sql: ${convert_tz} = 'yes' ;;
  }

  dimension: datatype {
    label: "Datatype"
    type: string
    sql: f.value:datatype::varchar ;;
  }

  dimension: default_value {
    label: "Default Value"
    type: string
    sql: f.value:default_value::varchar ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: f.value:description::varchar ;;
  }

  dimension: full_suggestions {
    group_label: "Suggest"
    label: "Full Suggestions"
    type: string
    sql: f.value:full_suggestions::varchar ;;
  }

  dimension: full_suggestions_yn {
    group_label: "YesNo"
    label: "Full Suggestions"
    type: yesno
    sql: ${full_suggestions} = 'yes' ;;
  }

  dimension: group_item_label {
    label: "Group Item Label"
    type: string
    sql: f.value:group_item_label::varchar ;;
  }

  dimension: group_label {
    label: "Group Label"
    type: string
    sql: f.value:group_label::varchar;;
  }

  dimension: hidden {
    label: "Hidden"
    type: string
    sql: f.value:hidden::varchar ;;
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
    sql: COALESCE(f.value:label::varchar, initcap(replace(f.value:name::varchar, '_', ' '))) ;;
  }

  dimension: name {
    label: "Dimension Name"
    type: string
    sql: f.value:name::varchar ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants"
    type: string
    sql: f.value:required_access_grants::variant ;;
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
    sql: f.value:required_fields::variant ;;
    hidden: yes
  }

  dimension: required_fields_list {
    group_label: "Required Fields"
    label: "Required Fields List"
    type: string
    sql: array_to_string(parse_json(${required_fields}), ', ') ;;
  }

  dimension: skip_drill_filter {
    label: "Skip Drill Filter"
    type: string
    sql: f.value:skip_drill_filter::varchar ;;
  }

  dimension: sql {
    label: "SQL"
    type: string
    sql: f.value:sql::varchar ;;
  }

  dimension: suggest_dimension {
    group_label: "Suggest"
    label: "Suggest Dimension"
    type: string
    sql: f.value:suggest_dimension::varchar ;;
  }

  dimension: suggest_explore {
    group_label: "Suggest"
    label: "Suggest Explore"
    type: string
    sql: f.value:suggest_explore::varchar  ;;
  }

  dimension: suggest_persist_for {
    group_label: "Suggest"
    label: "Suggest Persist For"
    type: string
    sql: f.value:suggest_persist_for::varchar  ;;
  }

  dimension: suggestable {
    group_label: "Suggest"
    label: "Suggestable"
    type: string
    sql: f.value:suggestable::varchar  ;;
  }

  dimension: suggestions {
    group_label: "Suggest"
    label: "Suggestions"
    type: string
    sql: f.value:suggestions::variant ;;
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
    label: "Tags"
    type: string
    sql: f.value:tags::variant ;;
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
    sql: f.value:"type"::varchar ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: f.value:view_label::varchar ;;
  }

  measure: count {
    label: "Number of Filters"
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
      group_label,
      label,
      type,
      datatype,
      hidden,
      default_value,
      sql
    ]
  }
}
