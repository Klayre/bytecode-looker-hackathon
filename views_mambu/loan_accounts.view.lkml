view: loan_accounts {
  sql_table_name: MAMBU_BETA.LOAN_ACCOUNTS ;;
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

  dimension: account_arrears_settings {
    type: string
    sql: ${TABLE}."ACCOUNT_ARREARS_SETTINGS" ;;
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

  dimension: account_sub_state {
    type: string
    sql: ${TABLE}."ACCOUNT_SUB_STATE" ;;
  }

  dimension: accrued_interest {
    type: number
    sql: ${TABLE}."ACCRUED_INTEREST" ;;
  }

  dimension: accrued_penalty {
    type: number
    sql: ${TABLE}."ACCRUED_PENALTY" ;;
  }

  dimension: activation_transaction_key {
    type: string
    sql: ${TABLE}."ACTIVATION_TRANSACTION_KEY" ;;
  }

  dimension: allow_offset {
    type: yesno
    sql: ${TABLE}."ALLOW_OFFSET" ;;
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

  dimension: arrears_tolerance_period {
    type: number
    sql: ${TABLE}."ARREARS_TOLERANCE_PERIOD" ;;
  }

  dimension: assets {
    type: string
    sql: ${TABLE}."ASSETS" ;;
  }

  dimension: assigned_branch_key {
    type: string
    sql: ${TABLE}."ASSIGNED_BRANCH_KEY" ;;
  }

  dimension: assigned_centre_key {
    type: string
    sql: ${TABLE}."ASSIGNED_CENTRE_KEY" ;;
  }

  dimension: balances {
    type: string
    sql: ${TABLE}."BALANCES" ;;
  }

  dimension_group: closed {
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
    sql: ${TABLE}."CLOSED_DATE" ;;
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

  dimension: disbursement_details {
    type: string
    sql: ${TABLE}."DISBURSEMENT_DETAILS" ;;
  }

  dimension: encoded_key {
    type: string
    sql: ${TABLE}."ENCODED_KEY" ;;
  }

  dimension: funding_sources {
    type: string
    sql: ${TABLE}."FUNDING_SOURCES" ;;
  }

  dimension: future_payments_acceptance {
    type: string
    sql: ${TABLE}."FUTURE_PAYMENTS_ACCEPTANCE" ;;
  }

  dimension: guarantors {
    type: string
    sql: ${TABLE}."GUARANTORS" ;;
  }

  dimension: interest_from_arrears_accrued {
    type: number
    sql: ${TABLE}."INTEREST_FROM_ARREARS_ACCRUED" ;;
  }

  dimension: interest_settings {
    type: string
    sql: ${TABLE}."INTEREST_SETTINGS" ;;
  }

  dimension_group: last_interest_applied {
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
    sql: ${TABLE}."LAST_INTEREST_APPLIED_DATE" ;;
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

  dimension: late_payments_recalculation_method {
    type: string
    sql: ${TABLE}."LATE_PAYMENTS_RECALCULATION_METHOD" ;;
  }

  dimension: loan_amount {
    type: number
    sql: ${TABLE}."LOAN_AMOUNT" ;;
  }

  dimension: loan_name {
    type: string
    sql: ${TABLE}."LOAN_NAME" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."NOTES" ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD" ;;
  }

  dimension: penalty_settings {
    type: string
    sql: ${TABLE}."PENALTY_SETTINGS" ;;
  }

  dimension: prepayment_settings {
    type: string
    sql: ${TABLE}."PREPAYMENT_SETTINGS" ;;
  }

  dimension: product_type_key {
    type: string
    sql: ${TABLE}."PRODUCT_TYPE_KEY" ;;
  }

  dimension: schedule_settings {
    type: string
    sql: ${TABLE}."SCHEDULE_SETTINGS" ;;
  }

  dimension: tranches {
    type: string
    sql: ${TABLE}."TRANCHES" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, loan_name]
  }
}
