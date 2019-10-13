view: tasks {
  sql_table_name: MAMBU_BETA.TASKS ;;
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

  dimension: assigned_user_key {
    type: string
    sql: ${TABLE}."ASSIGNED_USER_KEY" ;;
  }

  dimension: created_by_full_name {
    type: string
    sql: ${TABLE}."CREATED_BY_FULL_NAME" ;;
  }

  dimension: created_by_user_key {
    type: string
    sql: ${TABLE}."CREATED_BY_USER_KEY" ;;
  }

  dimension_group: creation {
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
    sql: ${TABLE}."CREATION_DATE" ;;
  }

  dimension: custom_field_sets {
    type: string
    sql: ${TABLE}."CUSTOM_FIELD_SETS" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: due_date {
    type: string
    sql: ${TABLE}."DUE_DATE" ;;
  }

  dimension: encoded_key {
    type: string
    sql: ${TABLE}."ENCODED_KEY" ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}."LAST_MODIFIED_DATE" ;;
  }

  dimension: task_link_type {
    type: string
    sql: ${TABLE}."TASK_LINK_TYPE" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, created_by_full_name]
  }
}
