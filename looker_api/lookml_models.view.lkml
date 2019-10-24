view: lookml_models {
  sql_table_name: LOOKER.LOOKML_MODELS ;;

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

  dimension: allowed_db_connection_names {
    type: string
    sql: ${TABLE}."ALLOWED_DB_CONNECTION_NAMES" ;;
  }

  dimension: explores {
    type: string
    sql: ${TABLE}."EXPLORES" ;;
  }

  dimension: has_content {
    type: yesno
    sql: ${TABLE}."HAS_CONTENT" ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}."LABEL" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}."PROJECT_NAME" ;;
  }

  dimension: unlimited_db_connections {
    type: yesno
    sql: ${TABLE}."UNLIMITED_DB_CONNECTIONS" ;;
  }

  measure: count {
    type: count
    drill_fields: [name, project_name]
  }
}
