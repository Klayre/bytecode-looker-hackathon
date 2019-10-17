view: views__dimension_groups {
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimension_groups,
#                   dg.value::variant as dimension_group,
#                   dg.value:alias::variant as alias,
#                   dg.value:allow_fill::varchar as allow_fill,
#                   dg.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
#                   dg.value:can_filter::varchar as can_filter,
#                   dg.value:datatype::varchar as datatype,
#                   dg.value:description::varchar as description,
#                   dg.value:drill_fields::variant as drill_fields,
#                   dg.value:fanout_on::varchar as fanout_on,
#                   dg.value:full_suggestions::varchar as full_suggestions,
#                   dg.value:group_item_label::varchar as group_item_label,
#                   dg.value:group_label::varchar as group_label,
#                   dg.value:hidden::varchar as hidden,
#                   dg.value:html::varchar as html,
#                   dg.value:intervals::variant as intervals,
#                   dg.value:label::varchar as label,
#                   dg.value:name::varchar as name,
#                   dg.value:order_by_field::varchar as order_by_field,
#                   dg.value:required_access_grants::variant as required_access_grants,
#                   dg.value:skip_drill_filter::varchar as skip_drill_filter,
#                   dg.value:sql::varchar as "sql",
#                   dg.value:sql_end::varchar as sql_end,
#                   dg.value:sql_start::varchar as sql_start,
#                   dg.value:suggest_dimension::varchar as suggest_dimension,
#                   dg.value:suggest_explore::varchar as suggest_explore,
#                   dg.value:suggestable::varchar as suggestable,
#                   dg.value:tags::variant as tags,
#                   dg.value:timeframes::variant as timeframes,
#                   dg.value:type::varchar as type,
#                   dg.value:view_label::varchar as view_label
#           from lookml.views v
#           , lateral flatten(input => v.dimension_groups) dg ;;

  dimension: dimension_group_pk {
    label: "Dimension Group PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: alias {
    label: "Alias List"
    type: string
    sql: dg.value:alias::variant  ;;
    hidden: yes
  }

  dimension: allow_fill {
    label: "Allow Fill"
    type: string
    sql: dg.value:allow_fill::varchar ;;
  }

  dimension: allow_fill_yn {
    group_label: "YesNo"
    label: "Allow Fill y/n"
    type: yesno
    sql: ${allow_fill} = 'yes' ;;
  }

  dimension: bypass_suggest_restrictions {
    group_label: "Suggest"
    label: "Bypass Suggest Restrictions"
    type: string
    sql: dg.value:bypass_suggest_restrictions::varchar ;;
  }

  dimension: bypass_suggest_restrictions_yn {
    group_label: "YesNo"
    label: "Bypass Suggest Restrictions y/n"
    type: yesno
    sql: ${bypass_suggest_restrictions} = 'yes' ;;
  }

  dimension: can_filter {
    label: "Can Filter"
    type: string
    sql: dg.value:can_filter::varchar ;;
  }

  dimension: can_filter_yn {
    group_label: "YesNo"
    label: "Can Filter y/n"
    type: yesno
    sql: ${can_filter} = 'yes' ;;
  }

  dimension: datatype {
    label: "Datatype"
    type: string
    sql: dg.value:datatype::varchar ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: dg.value:description::varchar ;;
  }

  dimension: drill_fields {
    label: "Drill Fields List"
    type: string
    sql: dg.value:drill_fields::variant ;;
    hidden: yes
  }

  dimension: fanout_on {
    label: "Fanout On"
    type: string
    sql: dg.value:fanout_on::varchar ;;
  }

  dimension: full_suggestions {
    group_label: "Suggest"
    label: "Full Suggestions"
    type: string
    sql: dg.value:full_suggestions::varchar ;;
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
    sql: dg.value:group_item_label::varchar ;;
  }

  dimension: group_label {
    label: "Group Label"
    type: string
    sql: dg.value:group_label::varchar;;
  }

  dimension: hidden {
    label: "Hidden"
    type: string
    sql: dg.value:hidden::varchar ;;
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
    sql: dg.value:html::varchar ;;
  }

  dimension: intervals {
    label: "Intervals List"
    type: string
    sql: dg.value:intervals::variant ;;
    hidden: yes
  }

  dimension: label {
    label: "Label"
    type: string
    sql: dg.value:label::varchar ;;
  }

  dimension: name {
    label: "Dimension Group Name"
    type: string
    sql: dg.value:name::varchar ;;
  }

  dimension: order_by_field {
    label: "Order By Field"
    type: string
    sql: dg.value:order_by_field::varchar ;;
  }

  dimension: required_access_grants {
    label: "Required Access Grants JSON"
    type: string
    sql: dg.value:required_access_grants::variant ;;
    hidden: yes
  }

  dimension: skip_drill_filter {
    label: "Skip Drill Filter"
    type: string
    sql: dg.value:skip_drill_filter::varchar ;;
  }

  dimension: skip_drill_filter_yn {
    group_label: "YesNo"
    label: "Skip Drill Filter"
    type: yesno
    sql: ${skip_drill_filter} = 'yes' ;;
  }

  dimension: sql {
    label: "SQL"
    type: string
    sql: dg.value:sql::varchar ;;
  }

  dimension: sql_end {
    label: "SQL End"
    type: string
    sql: dg.value:sql_end::varchar ;;
  }

  dimension: sql_start {
    label: "SQL Start"
    type: string
    sql: dg.value:sql_start::varchar ;;
  }

  dimension: suggest_dimension {
    group_label: "Suggest"
    label: "Suggest Dimension"
    type: string
    sql: dg.value:suggest_dimension::varchar ;;
  }

  dimension: suggest_explore {
    group_label: "Suggest"
    label: "Suggest Explore"
    type: string
    sql: dg.value:suggest_explore::varchar  ;;
  }

  dimension: suggestable {
    group_label: "Suggest"
    label: "Suggestable"
    type: string
    sql: dg.value:suggestable::varchar  ;;
  }

  dimension: tags {
    label: "Tags List"
    type: string
    sql: dg.value:tags::variant ;;
    hidden: yes
  }

  dimension: timeframes {
    label: "Timeframes List"
    type: string
    sql: dg.value:timeframes::variant ;;
    hidden: yes
  }

  dimension: type {
    label: "Type"
    type: string
    sql: dg.value:type::varchar;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: dg.value:view_label::varchar ;;
  }

  measure: count {
    label: "Number of Dimension Groups"
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
      timeframes,
      intervals,
      sql,
      sql_start,
      sql_end
    ]
  }
}
