view: dashboard_filters {
  view_label: "Dashboard Filters"
  sql_table_name: LOOKER.DASHBOARD_FILTERS ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Dashboard Filter ID"
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

  dimension: allow_multiple_values {
    label: "Allow Multiple Values"
    type: yesno
    sql: ${TABLE}.ALLOW_MULTIPLE_VALUES ;;
  }

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.DASHBOARD_ID ;;
  }

  dimension: default_value {
    label: "Default Value"
    type: string
    sql: ${TABLE}.DEFAULT_VALUE ;;
  }

  dimension: dimension {
    label: "Dimension Name"
    type: string
    sql: ${TABLE}.DIMENSION ;;
  }

  dimension: explore {
    label: "Explore Name"
    type: string
    sql: ${TABLE}.EXPLORE ;;
  }

  dimension: field {
    group_label: "Field"
    label: "Field JSON"
    type: string
    sql: ${TABLE}.FIELD ;;
    hidden: yes
  }

  dimension: field_category {
    group_label: "Field"
    label: "Field Category"
    type: string
    sql: ${field}:category ;;
  }

  dimension: field_label {
    group_label: "Field"
    label: "Field Label"
    type: string
    sql: ${field}:label_short ;;
  }

  dimension: field_name {
    group_label: "Field"
    label: "Field Name"
    type: string
    sql: ${field}:name ;;
  }

  dimension: field_scope {
    group_label: "Field"
    label: "Field Scope"
    type: string
    sql: ${field}:scope ;;
  }

  dimension: field_type {
    group_label: "Field"
    label: "Field Type"
    type: string
    sql: ${field}:"type" ;;
  }

  dimension: field_view {
    group_label: "Field"
    label: "Field View"
    type: string
    sql: ${field}:view ;;
  }

  dimension: listens_to_filters {
    label: "Listens to Filters JSON"
    type: string
    sql: ${TABLE}.LISTENS_TO_FILTERS ;;
    hidden: yes
  }

  dimension: listens_to_filters_list {
    label: "Listens to Filters List"
    type: string
    sql: array_to_string(parse_json(${listens_to_filters}), ', ') ;;
  }

  dimension: model {
    label: "Model Name"
    type: string
    sql: ${TABLE}.MODEL ;;
  }

  dimension: name {
    label: "Dashboard Filter Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: required {
    label: "Is Required"
    type: yesno
    sql: ${TABLE}.REQUIRED ;;
  }

  dimension: row {
    label: "Filter Order"
    type: number
    sql: ${TABLE}."ROW" ;;
  }

  dimension: title {
    label: "Filter Title"
    type: string
    sql: ${TABLE}.TITLE ;;
  }

  dimension: type {
    label: "Filter Type"
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  dimension: ui_config {
    label: "UI Config JSON"
    type: string
    sql: ${TABLE}.UI_CONFIG ;;
    hidden: yes
  }

  # MEASURES
  measure: count {
    label: "Number of Dashboard Filters"
    type: count
    drill_fields: [detail*]
  }

  measure: count_date {
    label: "Number of Date Filters"
    type: count
    drill_fields: [detail*]
    filters: {
      field: type
      value: "date_filter"
    }
  }

  measure: count_string {
    label: "Number of String Filters"
    type: count
    drill_fields: [detail*]
    filters: {
      field: type
      value: "string_filter"
    }
  }

  measure: count_field {
    label: "Number of Field Filters"
    type: count
    drill_fields: [detail*]
    filters: {
      field: type
      value: "field_filter"
    }
  }

  measure: count_listens {
    label: "Number of Cascading Filters"
    type: count
    drill_fields: [detail*]
    filters: {
      field: listens_to_filters
      value: "Yes"
    }
  }

  set: detail {
    fields: [
      id,
      title,
      type,
      field_view,
      field_name,
      dashboard.title,
      model
    ]
  }
}
