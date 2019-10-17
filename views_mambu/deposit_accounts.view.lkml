view: deposit_accounts {
  sql_table_name: MAMBU_BETA.DEPOSIT_ACCOUNTS ;;
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

  dimension: account_holder_key {
    type: string
    sql: ${TABLE}."ACCOUNT_HOLDER_KEY" ;;
  }

  dimension: account_holder_type {
    type: string
    sql: ${TABLE}."ACCOUNT_HOLDER_TYPE" ;;
  }

  dimension: account_state {
    type: string
    sql: ${TABLE}."ACCOUNT_STATE" ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}."ACCOUNT_TYPE" ;;
  }

  dimension: accrued_amounts {
    type: string
    sql: ${TABLE}."ACCRUED_AMOUNTS" ;;
  }

  dimension_group: activation {
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
    sql: ${TABLE}."ACTIVATION_DATE" ;;
  }

  dimension_group: approved {
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
    sql: ${TABLE}."APPROVED_DATE" ;;
  }

  dimension: assigned_branch_key {
    type: string
    sql: ${TABLE}."ASSIGNED_BRANCH_KEY" ;;
  }

  dimension: balances {
    type: string
    sql: ${TABLE}."BALANCES" ;;
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

  dimension: currency_code {
    type: string
    sql: ${TABLE}."CURRENCY_CODE" ;;
  }

  dimension: custom_field_sets {
    type: string
    sql: ${TABLE}."CUSTOM_FIELD_SETS" ;;
  }

  dimension: encoded_key {
    type: string
    sql: ${TABLE}."ENCODED_KEY" ;;
  }

  dimension: interest_settings {
    type: string
    sql: ${TABLE}."INTEREST_SETTINGS" ;;
  }

  dimension: internal_controls {
    type: string
    sql: ${TABLE}."INTERNAL_CONTROLS" ;;
  }

  dimension_group: last_account_appraisal {
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
    sql: ${TABLE}."LAST_ACCOUNT_APPRAISAL_DATE" ;;
  }

  dimension_group: last_interest_calculation {
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
    sql: ${TABLE}."LAST_INTEREST_CALCULATION_DATE" ;;
  }

  dimension_group: last_interest_stored {
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
    sql: ${TABLE}."LAST_INTEREST_STORED_DATE" ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."NOTES" ;;
  }

  dimension: overdraft_interest_settings {
    type: string
    sql: ${TABLE}."OVERDRAFT_INTEREST_SETTINGS" ;;
  }

  dimension: overdraft_settings {
    type: string
    sql: ${TABLE}."OVERDRAFT_SETTINGS" ;;
  }

  dimension: product_type_key {
    type: string
    sql: ${TABLE}."PRODUCT_TYPE_KEY" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
