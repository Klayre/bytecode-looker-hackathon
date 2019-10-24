view: explores {
  view_label: "Explores"
  sql_table_name: LOOKER.EXPLORES ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Explore ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._SDC_BATCHED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_extracted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._SDC_EXTRACTED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
    hidden: yes
  }

  dimension: access_filters {
    group_label: "Access Filters"
    label: "Access Filters JSON"
    type: string
    sql: ${TABLE}.ACCESS_FILTERS ;;
    hidden: yes
  }

  dimension: aliases {
    group_label: "Aliases"
    label: "Aliases JSON"
    type: string
    sql: ${TABLE}.ALIASES  ;;
    hidden: yes
  }

  dimension: always_filters {
    group_label: "Always Filters"
    label: "Always Filters JSON"
    type: string
    sql: ${TABLE}.ALWAYS_FILTER ;;
    hidden: yes
  }

  dimension: can_explain {
    group_label: "Can"
    label: "Can Explain"
    type: yesno
    sql: ${TABLE}.CAN_EXPLAIN ;;
  }

  dimension: can_pivot_in_db {
    group_label: "Can"
    label: "Can Pivot in DB"
    type: yesno
    sql: ${TABLE}.CAN_PIVOT_IN_DB ;;
  }

  dimension: can_save {
    group_label: "Can"
    label: "Can Save"
    type: yesno
    sql: ${TABLE}.CAN_SAVE ;;
  }

  dimension: can_subtotal {
    group_label: "Can"
    label: "Can Subtotal"
    type: yesno
    sql: ${TABLE}.CAN_SUBTOTAL ;;
  }

  dimension: can_total {
    group_label: "Can"
    label: "Can Total"
    type: yesno
    sql: ${TABLE}.CAN_TOTAL ;;
  }

  dimension: conditionally_filter {
    group_label: "Conditionally Filter"
    label: "Conditionally Filter JSON"
    type: string
    sql: ${TABLE}.CONDITIONALLY_FILTER ;;
    hidden: yes
  }

  dimension: connection_name {
    label: "Connection Name"
    type: string
    sql: ${TABLE}.CONNECTION_NAME ;;
  }

  dimension: errors {
    group_label: "Errors"
    label: "Errors JSON"
    type: string
    sql: ${TABLE}.ERRORS ;;
    hidden: yes
  }

  dimension: fields {
    group_label: "Fields"
    label: "Fields JSON"
    type: string
    sql: ${TABLE}.FIELDS ;;
    hidden: yes
  }

  dimension: fields_list {
    group_label: "Fields"
    label: "Fields List"
    type: string
    sql: array_to_string(parse_json(${fields}), ', ') ;;
  }

  dimension: files {
    group_label: "Files"
    label: "Files JSON"
    type: string
    sql: ${TABLE}.FILES ;;
    hidden: yes
  }

  dimension: group_label {
    label: "Group Label"
    type: string
    sql: ${TABLE}.GROUP_LABEL ;;
  }

  dimension: has_timezone_support {
    label: "Has Timezone Support"
    type: yesno
    sql: ${TABLE}.HAS_TIMEZONE_SUPPORT ;;
  }

  dimension: hidden {
    label: "Is Hidden"
    type: yesno
    sql: ${TABLE}.HIDDEN ;;
  }

  dimension: index_fields {
    group_label: "Index Field"
    label: "Index Fields JSON"
    type: string
    sql: ${TABLE}.INDEX_FIELDS ;;
    hidden: yes
  }

  dimension: index_fields_list {
    group_label: "Index Fields"
    label: "Index Fields List"
    type: string
    sql: array_to_string(parse_json(${index_fields}), ', ') ;;
  }

  dimension: joins {
    group_label: "Joins"
    label: "Joins JSON"
    type: string
    sql: ${TABLE}.JOINS ;;
    hidden: yes
  }

  dimension: label {
    label: "Explore Label"
    type: string
    sql: ${TABLE}.LABEL ;;
  }

  dimension: model_name {
    label: "Model Name"
    type: string
    sql: ${TABLE}.MODEL_NAME ;;
  }

  dimension: name {
    label: "Explore Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: null_sort_treatment {
    label: "Null Sort Treatment"
    type: string
    sql: ${TABLE}.NULL_SORT_TREATMENT ;;
  }

  dimension: project_name {
    label: "Project Name"
    type: string
    sql: ${TABLE}.PROJECT_NAME ;;
  }

  dimension: scopes {
    label: "Scopes JSON"
    type: string
    sql: ${TABLE}.SCOPES ;;
    hidden: yes
  }

  dimension: scopes_list {
    label: "Scopes List"
    type: string
    sql: array_to_string(parse_json(${scopes}), ', ') ;;
  }

  dimension: sets {
    label: "Sets JSON"
    type: string
    sql: ${TABLE}.SETS ;;
    hidden: yes
  }

  dimension: source_file {
    label: "Source File"
    type: string
    sql: ${TABLE}.SOURCE_FILE ;;
  }

  dimension: sql_table_name {
    label: "SQL Table Name"
    type: string
    sql: ${TABLE}.SQL_TABLE_NAME ;;
  }

  dimension: supported_measure_types {
    label: "Supported Measure Types JSON"
    type: string
    sql: ${TABLE}.SUPPORTED_MEASURE_TYPES ;;
    hidden: yes
  }

  dimension: supports_cost_estimate {
    label: "Supports Cost Estimate"
    type: yesno
    sql: ${TABLE}.SUPPORTS_COST_ESTIMATE ;;
  }

  dimension: tags {
    label: "Tags JSON"
    type: string
    sql: ${TABLE}.TAGS ;;
    hidden: yes
  }

  dimension: tags_list {
    label: "Tags List"
    type: string
    sql: array_to_string(parse_json(${tags}), ', ') ;;
  }

  dimension: view_name {
    label: "View Name"
    type: string
    sql: ${TABLE}.VIEW_NAME ;;
  }

  measure: count {
    label: "Number of Explores"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      label,
      group_label,
      view_name,
      model_name,
      project_name,
      connection_name,
      sql_table_name,
      source_file,
      hidden
    ]
  }
}
