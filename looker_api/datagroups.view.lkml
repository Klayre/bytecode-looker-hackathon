view: datagroups {
  view_label: "Datagroups"
  sql_table_name: LOOKER.DATAGROUPS ;;
  drill_fields: [detail*]

  dimension: id {
    label: "Datagroup ID"
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

  dimension_group: created {
    type: time
    datatype: epoch
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT::INT ;;
  }

  dimension: model_name {
    label: "Model Name"
    type: string
    sql: ${TABLE}.MODEL_NAME ;;
  }

  dimension: name {
    label: "Datagroup Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension_group: stale_before {
    type: time
    datatype: epoch
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.STALE_BEFORE::INT ;;
  }

  dimension_group: trigger_check {
    type: time
    datatype: epoch
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TRIGGER_CHECK_AT::INT ;;
  }

  dimension: trigger_error {
    label: "Trigger Error"
    type: string
    sql: ${TABLE}.TRIGGER_ERROR ;;
  }

  dimension: trigger_value {
    label: "Trigger Value"
    type: string
    sql: ${TABLE}.TRIGGER_VALUE ;;
  }

  measure: count {
    label: "Number of Datagroups"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      model_name,
      trigger_value,
      created_date,
      trigger_check_time,
      stale_before_time
    ]
  }
}
