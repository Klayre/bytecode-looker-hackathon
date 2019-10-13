view: deposit_transactions {
  sql_table_name: MAMBU_BETA.DEPOSIT_TRANSACTIONS ;;
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

  dimension: account_balances {
    type: string
    sql: ${TABLE}."ACCOUNT_BALANCES" ;;
  }

  dimension: adjustment_transaction_key {
    type: string
    sql: ${TABLE}."ADJUSTMENT_TRANSACTION_KEY" ;;
  }

  dimension: affected_amounts {
    type: string
    sql: ${TABLE}."AFFECTED_AMOUNTS" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: branch_key {
    type: string
    sql: ${TABLE}."BRANCH_KEY" ;;
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

  dimension: fees {
    type: string
    sql: ${TABLE}."FEES" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."NOTES" ;;
  }

  dimension: original_transaction_key {
    type: string
    sql: ${TABLE}."ORIGINAL_TRANSACTION_KEY" ;;
  }

  dimension: parent_account_key {
    type: string
    sql: ${TABLE}."PARENT_ACCOUNT_KEY" ;;
  }

  dimension: taxes {
    type: string
    sql: ${TABLE}."TAXES" ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}."TERMS" ;;
  }

  dimension: transaction_details {
    type: string
    sql: ${TABLE}."TRANSACTION_DETAILS" ;;
  }

  dimension: transfer_details {
    type: string
    sql: ${TABLE}."TRANSFER_DETAILS" ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: user_key {
    type: string
    sql: ${TABLE}."USER_KEY" ;;
  }

  dimension_group: value {
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
    sql: ${TABLE}."VALUE_DATE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
