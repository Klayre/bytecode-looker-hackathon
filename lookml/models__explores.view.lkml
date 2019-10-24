view: models__explores {
  view_label: "Explores"
#     sql: select  m.sha as model_sha,
#         m.path as model_path,
#         m.explores::variant as explores,
#         ex.value:access_filters::variant as access_filters,
#         ex.value:always_filter:filters::variant as always_filters,
#         ex.value:always_join::variant as always_joins,
#         ex.value:cancel_grouping_fields::variant as cancel_grouping_fields,
#         ex.value:case_sensitive::varchar as case_sensitive,
#         ex.value:conditionally_filter:filters::variant as conditionally_filter__filters,
#         ex.value:conditionally_filter:unless::variant as conditionally_filter__unless,
#         ex.value:description::varchar as description,
#         ex.value:extends::variant as extends,
#         ex.value:extension::varchar as extension,
#         ex.value:fields::variant as fields,
#         ex.value:from::varchar as "from",
#         ex.value:group_label::varchar as group_label,
#         ex.value:hidden::varchar as hidden,
#         ex.value:joins::variant as joins,
#         ex.value:label::varchar as label,
#         ex.value:name::varchar as name,
#         ex.value:persist_for::varchar as persist_for,
#         ex.value:persist_with::varchar as persist_with,
#         ex.value:required_access_grants::variant as required_access_grants,
#         ex.value:sql_always_having::varchar as sql_always_having,
#         ex.value:sql_always_where::varchar as sql_always_where,
#         ex.value:sql_table_name::varchar as sql_table_name,
#         ex.value:symmetric_aggregates::varchar as symmetric_aggregates,
#         ex.value:view_label::varchar as view_label,
#         ex.value:view_name::varchar as view_name
# from lookml.models m
# , lateral flatten(input => m.explores) ex ;;


  dimension: explores_pk {
    label: "Explores PK"
    type: string
    primary_key: yes
    sql: ${models.model_pk}  || '-' ${name} ;;
    hidden: yes
  }

  dimension: access_filters {
    group_label: "Access Filters"
    label: "Access Filters JSON"
    type: string
    sql: ex.value:access_filters::variant ;;
    hidden: yes
  }

  dimension: always_filters {
    group_label: "Always Filters"
    label: "Always Filters JSON"
    type: string
    sql: ex.value:always_filter:filters::variant ;;
    hidden: yes
  }

  dimension: always_joins {
    group_label: "Always Joins"
    label: "Always Joins JSON"
    type: string
    sql: ex.value:always_join::variant ;;
    hidden: yes
  }

  dimension: always_joins_list {
    group_label: "Always Joins"
    label: "Always Joins List"
    type: string
    sql:array_to_string(parse_json(${always_joins}), ', ') ;;
  }

  dimension: base_view_name {
    label: "Base View Name"
    type: string
    sql: COALESCE(${from}, ${view_name}, ${name}) ;;
  }

  dimension: cancel_grouping_fields {
    group_label: "Cancel Grouping Fields"
    label: "Cancel Grouping Fields JSON"
    type: string
    sql: ex.value:cancel_grouping_fields::variant ;;
    hidden: yes
  }

  dimension: cancel_grouping_fields_list {
    group_label: "Cancel Grouping Fields"
    label: "Cancel Grouping Fields List"
    type: string
    sql:array_to_string(parse_json(${cancel_grouping_fields}), ', ') ;;
  }

  dimension: case_sensitive {
    label: "Case Sensitive"
    type: string
    sql: ex.value:case_sensitive::varchar  ;;
  }

  dimension: case_sensitive_yn {
    group_label: "YesNo"
    label: "Case Sensitive"
    type: yesno
    sql: ${case_sensitive} = 'yes'  ;;
  }

  dimension: conditionally_filter__filters {
    group_label: "Conditionally Filters"
    label: "Conditionally Filter - Filters JSON"
    type: string
    sql: ex.value:conditionally_filter:filters::variant ;;
    hidden: yes
  }

  dimension: conditionally_filter__unless {
    group_label: "Conditionally Filters"
    label: "Conditionally Filter Unless JSON"
    type: string
    sql: ex.value:conditionally_filter:unless::variant ;;
    hidden: yes
  }

  dimension: conditionally_filter__unless_list {
    group_label: "Conditionally Filters"
    label: "Conditionally Filter Unless List"
    type: string
    sql:array_to_string(parse_json(${conditionally_filter__unless}), ', ') ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: ex.value:description::varchar ;;
  }

  dimension: extends {
    group_label: "Extends"
    label: "Extends JSON"
    type: string
    sql: ex.value:extends::variant ;;
    hidden: yes
  }

  dimension: extends_list {
    group_label: "Extends"
    label: "Extends List"
    type: string
    sql:array_to_string(parse_json(${extends}), ', ') ;;
  }

  dimension: extension {
    group_label: "Extends"
    label: "Extension"
    type: string
    sql: ex.value:extension::varchar ;;
  }

  dimension: fields {
    group_label: "Fields"
    label: "Fields JSON"
    type: string
    sql: ex.value:fields::variant ;;
    hidden: yes
  }

  dimension: fields_list {
    group_label: "Fields"
    label: "Fields List"
    type: string
    sql:array_to_string(parse_json(${fields}), ', ') ;;
  }

  dimension: from {
    label: "From"
    type: string
    sql: ex.value:from::varchar ;;
  }

  dimension: group_label {
    label: "Group Label"
    type: string
    sql: ex.value:group_label::varchar ;;
  }

  dimension: hidden {
    label: "Hidden"
    type: string
    sql: ex.value:hidden::varchar ;;
  }

  dimension: hidden_yn {
    group_label: "YesNo"
    label: "Hidden"
    type: yesno
    sql: ${hidden} = 'yes'  ;;
  }

  dimension: joins {
    label: "Joins JSON"
    type: string
    sql: ex.value:joins::variant ;;
    hidden: yes
  }

  dimension: label {
    label: "Label"
    type: string
    sql: ex.value:label::varchar ;;
  }

  dimension: name {
    label: "Explore Name"
    type: string
    sql: ex.value:name::varchar ;;
  }

  dimension: persist_for {
    group_label: "Persist"
    label: "Persist For"
    type: string
    sql: ex.value:persist_for::varchar ;;
  }

  dimension: persist_with {
    group_label: "Persist"
    label: "Persist With"
    type: string
    sql: ex.value:persist_with::varchar ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants"
    type: string
    sql: ex.value:required_access_grants::variant ;;
    hidden: yes
  }

  dimension: required_access_grants_list {
    group_label: "Required Access Grants"
    label: "Required Access Grants List"
    type: string
    sql:array_to_string(parse_json(${required_access_grants}), ', ') ;;
  }

  dimension: sql_always_having {
    group_label: "SQL"
    label: "SQL Always Having"
    type: string
    sql: ex.value:sql_always_having::varchar ;;
  }

  dimension: sql_always_where {
    group_label: "SQL"
    label: "SQL Always Where"
    type: string
    sql: ex.value:sql_always_where::varchar ;;
  }

  dimension: sql_table_name {
    group_label: "SQL"
    label: "SQL Table Name"
    type: string
    sql: ex.value:sql_table_name::varchar ;;
  }

  dimension: symmetric_aggregates {
    label: "Symmetric Aggregates"
    type: string
    sql: ex.value:symmetric_aggregates::varchar ;;
  }

  dimension: symmetric_aggregates_yn {
    group_label: "YesNo"
    label: "Symmetric Aggregates"
    type: yesno
    sql: ${symmetric_aggregates} = 'yes'  ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: ex.value:view_label::varchar ;;
  }

  dimension: view_name {
    label: "View Name"
    type: string
    sql: ex.value:view_name::varchar ;;
  }

  measure: count {
    label: "Number of Explores"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      name,
      group_label,
      label,
      description,
      from,
      view_name,
      view_label
    ]
  }

}
