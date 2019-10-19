
view: views__measures {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:actions::variant as actions,
#                   m.value:alias::variant as alias,
#                   m.value:approximate::varchar as approximate,
#                   m.value:approximate_threshold::varchar as approximate_threshold,
#                   m.value:can_filter::varchar as can_filter,
#                   m.value:convert_tz::varchar as convert_tz,
#                   m.value:datatype::varchar as datatype,
#                   m.value:description::varchar as description,
#                   m.value:direction::varchar as direction,
#                   m.value:drill_fields::variant as drill_fields,
#                   m.value:fanout_on::varchar as fanout_on,
#                   m.value:filters::variant as filters,
#                   m.value:group_item_label::varchar as group_item_label,
#                   m.value:group_label::varchar as group_label,
#                   m.value:hidden::varchar as hidden,
#                   m.value:html::varchar as html,
#                   m.value:label::varchar as label,
#                   m.value:label_from_parameter::varchar as label_from_parameter,
#                   m.value:links::variant as links,
#                   m.value:list_field::varchar as list_field,
#                   m.value:name::varchar as name,
#                   m.value:percentile::varchar as percentile,
#                   m.value:precision::varchar as precision,
#                   m.value:required_access_grants::variant as required_access_grants,
#                   m.value:required_fields::variant as required_fields,
#                   m.value:sql::varchar as "sql",
#                   m.value:sql_distinct_key::varchar as sql_distinct_key,
#                   m.value:suggest_dimension::varchar as suggest_dimension,
#                   m.value:suggest_explore::varchar as suggest_explore,
#                   m.value:suggestable::varchar as suggestable,
#                   m.value:tags::variant as tags,
#                   m.value:type::varchar as type,
#                   m.value:value_format::varchar as value_format,
#                   m.value:value_format_name::varchar as value_format_name,
#                   m.value:view_label::varchar as view_label
#           from lookml.views v
#           , lateral flatten(input => v.measures) m ;;

  dimension: measure_pk {
    label: "Measure PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: actions {
    group_label: "Actions"
    label: "Actions JSON"
    type: string
    sql: m.value:actions::variant  ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Alias JSON"
    type: string
    sql: m.value:alias::variant  ;;
    hidden: yes
  }

  dimension: alias_list {
    group_label: "Aliases"
    label: "Alias List"
    type: string
    sql: array_to_string(parse_json(${alias}), ', ') ;;
  }

  dimension: approximate {
    label: "Approximate"
    type: string
    sql: m.value:approximate::variant  ;;
  }

  dimension: approximate_yn {
    group_label: "YesNo"
    label: "Approximate"
    type: yesno
    sql: ${approximate} = 'yes' ;;
  }

  dimension: approximate_threshold {
    label: "Approximate Threshold"
    type: number
    sql: m.value:approximate_threshold::variant  ;;
  }

  dimension: can_filter {
    label: "Can Filter"
    type: string
    sql: m.value:can_filter::varchar ;;
  }

  dimension: can_filter_yn {
    group_label: "YesNo"
    label: "Can Filter"
    type: yesno
    sql: ${can_filter} = 'yes' ;;
  }

  dimension: convert_tz {
    label: "Convert Timezone"
    type: string
    sql: m.value:convert_tz::varchar ;;
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
    sql: m.value:datatype::varchar ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: m.value:description::varchar ;;
  }

  dimension: direction {
    label: "Direction"
    type: string
    sql: m.value:direction::varchar ;;
  }

  dimension: drill_fields {
    group_label: "Drill Fields"
    label: "Drill Fields JSON"
    type: string
    sql: m.value:drill_fields::variant ;;
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
    sql: m.value:fanout_on::varchar ;;
  }

  dimension: filters {
    group_label: "Filters"
    label: "Filters JSON"
    type: string
    sql: m.value:filters::variant ;;
    hidden: yes
  }

  dimension: group_item_label {
    label: "Group Item Label"
    type: string
    sql: m.value:group_item_label::varchar ;;
  }

  dimension: group_label {
    label: "Group Label"
    type: string
    sql: m.value:group_label::varchar;;
  }

  dimension: hidden {
    label: "Hidden"
    type: string
    sql: m.value:hidden::varchar ;;
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
    sql: m.value:html::varchar ;;
  }

  dimension: label {
    label: "Label"
    type: string
    sql: m.value:label::varchar ;;
  }

  dimension: label_from_parameter {
    label: "Label From Parameter"
    type: string
    sql: m.value:label_from_parameter::varchar ;;
  }

  dimension: links {
    group_label: "Links"
    label: "Links JSON"
    type: string
    sql: m.value:links::variant ;;
    hidden: yes
  }

  dimension: list_field {
    label: "List Field"
    type: string
    sql: m.value:list_field::varchar ;;
  }

  dimension: name {
    label: "Measure Name"
    type: string
    sql: m.value:name::varchar ;;
  }

  dimension: percentile {
    label: "Percentile"
    type: number
    sql: m.value:percentile::variant  ;;
  }

  dimension: precision {
    label: "Precision"
    type: number
    sql: m.value:precision::variant  ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants"
    type: string
    sql: m.value:required_access_grants::variant ;;
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
    sql: m.value:required_fields::variant ;;
    hidden: yes
  }

  dimension: required_fields_list {
    group_label: "Required Fields"
    label: "Required Fields List"
    type: string
    sql: array_to_string(parse_json(${required_fields}), ', ') ;;
  }

  dimension: sql {
    label: "SQL"
    type: string
    sql: m.value:sql::varchar ;;
  }

  dimension: sql_distinct_key {
    label: "SQL Distinct Key"
    type: string
    sql: m.value:sql_distinct_key::varchar ;;
  }

  dimension: suggest_dimension {
    group_label: "Suggest"
    label: "Suggest Dimension"
    type: string
    sql: m.value:suggest_dimension::varchar ;;
  }

  dimension: suggest_explore {
    group_label: "Suggest"
    label: "Suggest Explore"
    type: string
    sql: m.value:suggest_explore::varchar  ;;
  }

  dimension: suggestable {
    group_label: "Suggest"
    label: "Suggestable"
    type: string
    sql: m.value:suggestable::varchar  ;;
  }

  dimension: tags {
    group_label: "Tags"
    label: "Tags"
    type: string
    sql: m.value:tags::variant ;;
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
    sql: m.value:type::varchar;;
  }

  dimension: value_format {
    label: "Value Format"
    type: string
    sql: m.value:value_format::varchar ;;
  }

  dimension: value_format_name {
    label: "Value Format Name"
    type: string
    sql: m.value:value_format_name::varchar ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: m.value:view_label::varchar ;;
  }

  measure: count {
    label: "Number of Measures"
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
      label_from_parameter,
      type,
      datatype,
      hidden,
      approximate,
      direction,
      list_field,
      percentile,
      precision,
      sql,
      sql_distinct_key
    ]
  }
}
