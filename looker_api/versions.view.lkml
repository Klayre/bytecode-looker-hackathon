view: versions {
  sql_table_name: LOOKER.VERSIONS ;;

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

  dimension: current_version {
    type: string
    sql: ${TABLE}."CURRENT_VERSION" ;;
  }

  dimension: looker_release_version {
    type: string
    sql: ${TABLE}."LOOKER_RELEASE_VERSION" ;;
  }

  dimension: supported_versions {
    type: string
    sql: ${TABLE}."SUPPORTED_VERSIONS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
