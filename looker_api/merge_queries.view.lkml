view: merge_queries {
  sql_table_name: LOOKER.MERGE_QUERIES ;;
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

  dimension: pivots {
    type: string
    sql: ${TABLE}."PIVOTS" ;;
  }

  dimension: result_maker_id {
    type: string
    sql: ${TABLE}."RESULT_MAKER_ID" ;;
  }

  dimension: source_queries {
    type: string
    sql: ${TABLE}."SOURCE_QUERIES" ;;
  }

  dimension: total {
    type: yesno
    sql: ${TABLE}."TOTAL" ;;
  }

  dimension: vis_config {
    type: string
    sql: ${TABLE}."VIS_CONFIG" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
