view: queries {
  sql_table_name: LOOKER.QUERIES ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
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
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
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
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
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
    sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}."CLIENT_ID" ;;
  }

  dimension: column_limit {
    type: string
    sql: ${TABLE}."COLUMN_LIMIT" ;;
  }

  dimension: dynamic_fields {
    type: string
    sql: ${TABLE}."DYNAMIC_FIELDS" ;;
  }

  dimension: expanded_share_url {
    type: string
    sql: ${TABLE}."EXPANDED_SHARE_URL" ;;
  }

  dimension: fields {
    type: string
    sql: ${TABLE}."FIELDS" ;;
  }

  dimension: fill_fields {
    type: string
    sql: ${TABLE}."FILL_FIELDS" ;;
  }

  dimension: filter_config {
    type: string
    sql: ${TABLE}."FILTER_CONFIG" ;;
  }

  dimension: filters {
    type: string
    sql: ${TABLE}."FILTERS" ;;
  }

  dimension: has_table_calculations {
    type: yesno
    sql: ${TABLE}."HAS_TABLE_CALCULATIONS" ;;
  }

  dimension: limit {
    type: string
    sql: ${TABLE}."LIMIT" ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}."MODEL" ;;
  }

  dimension: pivots {
    type: string
    sql: ${TABLE}."PIVOTS" ;;
  }

  dimension: query_timezone {
    type: string
    sql: ${TABLE}."QUERY_TIMEZONE" ;;
  }

  dimension: row_total {
    type: string
    sql: ${TABLE}."ROW_TOTAL" ;;
  }

  dimension: runtime {
    type: number
    sql: ${TABLE}."RUNTIME" ;;
  }

  dimension: share_url {
    type: string
    sql: ${TABLE}."SHARE_URL" ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}."SLUG" ;;
  }

  dimension: sorts {
    type: string
    sql: ${TABLE}."SORTS" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
  }

  dimension: view {
    type: string
    sql: ${TABLE}."VIEW" ;;
  }

  dimension: vis_config {
    type: string
    sql: ${TABLE}."VIS_CONFIG" ;;
  }

  dimension: visible_ui_sections {
    type: string
    sql: ${TABLE}."VISIBLE_UI_SECTIONS" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
