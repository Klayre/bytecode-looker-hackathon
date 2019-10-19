view: views__dimensions {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:actions::variant as actions,
#                   d.value:alias::variant as alias,
#                   d.value:alpha_sort::varchar as alpha_sort,
#                   d.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
#                   d.value:can_filter::varchar as can_filter,
#                   d.value:"case":whens::variant as case__whens,
#                   d.value:case_sensitive::varchar as case_sensitive,
#                   d.value:convert_tz::varchar as convert_tz, --
#                   d.value:datatype::varchar as datatype,
#                   d.value:description::varchar as description,
#                   d.value:drill_fields::variant as drill_fields,
#                   d.value:fanout_on::varchar as fanout_on,
#                   d.value:full_suggestions::varchar as full_suggestions,
#                   d.value:group_item_label::varchar as group_item_label,
#                   d.value:group_label::varchar as group_label,
#                   d.value:hidden::varchar as hidden,
#                   d.value:html::varchar as html,
#                   d.value:label::varchar as label,
#                   d.value:label_from_parameter::varchar as label_from_parameter,
#                   d.value:links::variant as links,
#                   d.value:map_layer_name::varchar as map_layer_name,
#                   d.value:name::varchar as name,
#                   d.value:order_by_field::varchar as order_by_field,
#                   d.value:primary_key::varchar as primary_key,
#                   d.value:required_access_grants::variant as required_access_grants,
#                   d.value:required_fields::variant as required_fields,
#                   d.value:skip_drill_filter::varchar as skip_drill_filter,
#                   d.value:sql::varchar as "sql",
#                   d.value:sql_end::varchar as sql_end,
#                   d.value:sql_latitude::varchar as sql_latitude,
#                   d.value:sql_longitude::varchar as sql_longitude,
#                   d.value:sql_start::varchar as sql_start,
#                   d.value:style::varchar as style,
#                   d.value:suggest_dimension::varchar as suggest_dimension,
#                   d.value:suggest_explore::varchar as suggest_explore,
#                   d.value:suggest_persist_for::varchar as suggest_persist_for,
#                   d.value:suggestable::varchar as suggestable,
#                   d.value:suggestions::variant as suggestions,
#                   d.value:tags::variant as tags,
#                   d.value:tiers::variant as tiers,
#                   d.value:type::varchar as type,
#                   d.value:value_format::varchar as value_format,
#                   d.value:value_format_name::varchar as value_format_name,
#                   d.value:view_label::varchar as view_label
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d ;;

  dimension: dimension_pk {
    label: "Dimension PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: actions {
    group_label: "Actions"
    label: "Actions JSON"
    type: string
    sql: d.value:actions::variant  ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Aliases"
    type: string
    sql: d.value:alias::variant  ;;
    hidden: yes
  }

  dimension: alias_list {
    group_label: "Aliases"
    label: "Aliases List"
    type: string
    sql: array_to_string(parse_json(${alias}), ', ') ;;
  }

  dimension: alpha_sort {
    label: "Alpha Sort"
    type: string
    sql: d.value:alpha_sort::varchar ;;
  }

  dimension: alpha_sort_yn {
    group_label: "YesNo"
    label: "Alpha Sort"
    type: yesno
    sql: ${alpha_sort} = 'yes' ;;
  }

  dimension: bypass_suggest_restrictions {
    group_label: "Suggest"
    label: "Bypass Suggest Restrictions"
    type: string
    sql: d.value:bypass_suggest_restrictions::varchar ;;
  }

  dimension: bypass_suggest_restrictions_yn {
    group_label: "YesNo"
    label: "Bypass Suggest Restrictions"
    type: yesno
    sql: ${bypass_suggest_restrictions} = 'yes' ;;
  }

  dimension: can_filter {
    label: "Can Filter"
    type: string
    sql: d.value:can_filter::varchar ;;
  }

  dimension: can_filter_yn {
    group_label: "YesNo"
    label: "Can Filter"
    type: yesno
    sql: ${can_filter} = 'yes' ;;
  }

  dimension: case__whens {
    group_label: "Case"
    label: "Case Whens JSON"
    type: string
    sql: d.value:"case":whens::variant ;;
    hidden: yes
  }

  dimension: case__whens_list {
    group_label: "Case"
    label: "Case Whens List"
    type: string
    sql: array_to_string(parse_json(${case__whens}), ', ') ;;
  }

  dimension: case_sensitive {
    label: "Case Sensitive"
    type: string
    sql: d.value:case_sensitive::varchar ;;
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
    sql: d.value:convert_tz::varchar ;;
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
    sql: d.value:datatype::varchar ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: d.value:description::varchar ;;
  }

  dimension: drill_fields {
    group_label: "Drill Fields"
    label: "Drill Fields JSON"
    type: string
    sql: d.value:drill_fields::variant ;;
    hidden: yes
  }

  dimension: drill_fields_list {
    group_label: "Drill Fields"
    label: "Drill Fields List"
    type: string
    sql: array_to_string(parse_json(${drill_fields}), ', ') ;;
  }

  dimension: fanout_on {
    label: "Fanout On"
    type: string
    sql: d.value:fanout_on::varchar ;;
  }

  dimension: full_suggestions {
    group_label: "Suggest"
    label: "Full Suggestions"
    type: string
    sql: d.value:full_suggestions::varchar ;;
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
    sql: d.value:group_item_label::varchar ;;
  }

  dimension: group_label {
    label: "Group Label"
    type: string
    sql: d.value:group_label::varchar;;
  }

  dimension: hidden {
    label: "Hidden"
    type: string
    sql: d.value:hidden::varchar ;;
  }

  dimension: hidden_yn {
    group_label: "YesNo"
    label: "Hidden"
    type: yesno
    sql: ${hidden} = 'yes' ;;
  }

  dimension: html {
    label: "HTML"
    type: string
    sql: d.value:html::varchar ;;
  }

  dimension: label {
    label: "Label"
    type: string
    sql: d.value:label::varchar ;;
  }

  dimension: label_from_parameter {
    label: "Label From Parameter"
    type: string
    sql: d.value:label_from_parameter::varchar ;;
  }

  dimension: links {
    group_label: "Links"
    label: "Links JSON"
    type: string
    sql: d.value:links::variant ;;
    hidden: yes
  }

  dimension: map_layer_name {
    label: "Map Layer Name"
    type: string
    sql: d.value:map_layer_name::varchar ;;
  }

  dimension: name {
    label: "Dimension Name"
    type: string
    sql: d.value:name::varchar ;;
  }

  dimension: order_by_field {
    label: "Order By Field"
    type: string
    sql: d.value:order_by_field::varchar ;;
  }

  dimension: primary_key {
    label: "Primary Key"
    type: string
    sql: d.value:primary_key::varchar ;;
  }

  dimension: primary_key_yn {
    group_label: "YesNo"
    label: "Primary Key"
    type: yesno
    sql: ${primary_key} = 'yes' ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants"
    type: string
    sql: d.value:required_access_grants::variant ;;
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
    sql: d.value:required_fields::variant ;;
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
    sql: d.value:skip_drill_filter::varchar ;;
  }

  dimension: skip_drill_filter_yn {
    group_label: "YesNo"
    label: "Skip Drill Filter"
    type: yesno
    sql: ${skip_drill_filter} = 'yes' ;;
  }

  dimension: sql {
    group_label: "SQL"
    label: "SQL"
    type: string
    sql: d.value:sql::varchar ;;
  }

  dimension: sql_end {
    group_label: "SQL"
    label: "SQL End"
    type: string
    sql: d.value:sql_end::varchar ;;
  }

  dimension: sql_latitude {
    group_label: "SQL"
    label: "SQL Latitude"
    type: string
    sql: d.value:sql_latitude::varchar ;;
  }

  dimension: sql_longitude {
    group_label: "SQL"
    label: "SQL Longitude"
    type: string
    sql: d.value:sql_longitude::varchar ;;
  }

  dimension: sql_start {
    group_label: "SQL"
    label: "SQL Start"
    type: string
    sql: d.value:sql_start::varchar ;;
  }

  dimension: style {
    label: "Style"
    type: string
    sql: d.value:style::varchar ;;
  }

  dimension: suggest_dimension {
    group_label: "Suggest"
    label: "Suggest Dimension"
    type: string
    sql: d.value:suggest_dimension::varchar ;;
  }

  dimension: suggest_explore {
    group_label: "Suggest"
    label: "Suggest Explore"
    type: string
    sql: d.value:suggest_explore::varchar  ;;
  }

  dimension: suggest_persist_for {
    group_label: "Suggest"
    label: "Suggest Persist For"
    type: string
    sql: d.value:suggest_persist_for::varchar  ;;
  }

  dimension: suggestable {
    group_label: "Suggest"
    label: "Suggestable"
    type: string
    sql: d.value:suggestable::varchar  ;;
  }

  dimension: suggestions {
    group_label: "Suggest"
    label: "Suggestions"
    type: string
    sql: d.value:suggestions::variant ;;
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
    sql: d.value:tags::variant ;;
    hidden: yes
  }

  dimension: tags_list {
    group_label: "Tags"
    label: "Tags List"
    type: string
    sql: array_to_string(parse_json(${tags}), ', ') ;;
  }

  dimension: tiers {
    group_label: "Tiers"
    label: "Tiers JSON"
    type: string
    sql: d.value:tiers::variant ;;
    hidden: yes
  }

  dimension: tiers_list {
    group_label: "Tiers"
    label: "Tiers List"
    type: string
    sql: array_to_string(parse_json(${tiers}), ', ') ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: d.value:type::varchar;;
  }

  dimension: value_format {
    label: "Value Format"
    type: string
    sql: d.value:value_format::varchar ;;
  }

  dimension: value_format_name {
    label: "Value Format Name"
    type: string
    sql: d.value:value_format_name::varchar ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: d.value:view_label::varchar ;;
  }

  measure: count {
    label: "Number of Dimensions"
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
      tiers_list,
      sql
    ]
  }
}
