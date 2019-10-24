view: user_attributes {
  sql_table_name: LOOKER.USER_ATTRIBUTES ;;
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

  dimension: default_value {
    type: string
    sql: ${TABLE}."DEFAULT_VALUE" ;;
  }

  dimension: is_system {
    type: yesno
    sql: ${TABLE}."IS_SYSTEM" ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}."LABEL" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: user_can_edit {
    type: yesno
    sql: ${TABLE}."USER_CAN_EDIT" ;;
  }

  dimension: user_can_view {
    type: yesno
    sql: ${TABLE}."USER_CAN_VIEW" ;;
  }

  dimension: value_is_hidden {
    type: yesno
    sql: ${TABLE}."VALUE_IS_HIDDEN" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
