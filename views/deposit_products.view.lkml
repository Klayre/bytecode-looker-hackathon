view: deposit_products {
  sql_table_name: MAMBU_BETA.DEPOSIT_PRODUCTS ;;
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

  dimension: accounting_method {
    type: string
    sql: ${TABLE}."ACCOUNTING_METHOD" ;;
  }

  dimension: activated {
    type: yesno
    sql: ${TABLE}."ACTIVATED" ;;
  }

  dimension: allow_arbitrary_fees {
    type: yesno
    sql: ${TABLE}."ALLOW_ARBITRARY_FEES" ;;
  }

  dimension: allow_offset {
    type: yesno
    sql: ${TABLE}."ALLOW_OFFSET" ;;
  }

  dimension: allow_overdraft {
    type: yesno
    sql: ${TABLE}."ALLOW_OVERDRAFT" ;;
  }

  dimension: allow_technical_overdraft {
    type: yesno
    sql: ${TABLE}."ALLOW_TECHNICAL_OVERDRAFT" ;;
  }

  dimension: available_product_branches {
    type: string
    sql: ${TABLE}."AVAILABLE_PRODUCT_BRANCHES" ;;
  }

  dimension: collect_interest_when_locked {
    type: yesno
    sql: ${TABLE}."COLLECT_INTEREST_WHEN_LOCKED" ;;
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

  dimension: currencies {
    type: string
    sql: ${TABLE}."CURRENCIES" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."DESCRIPTION" ;;
  }

  dimension: encoded_key {
    type: string
    sql: ${TABLE}."ENCODED_KEY" ;;
  }

  dimension: for_all_branches {
    type: yesno
    sql: ${TABLE}."FOR_ALL_BRANCHES" ;;
  }

  dimension: for_groups {
    type: yesno
    sql: ${TABLE}."FOR_GROUPS" ;;
  }

  dimension: for_individuals {
    type: yesno
    sql: ${TABLE}."FOR_INDIVIDUALS" ;;
  }

  dimension: id_generator_type {
    type: string
    sql: ${TABLE}."ID_GENERATOR_TYPE" ;;
  }

  dimension: id_pattern {
    type: string
    sql: ${TABLE}."ID_PATTERN" ;;
  }

  dimension: interest_accrued_accounting_method {
    type: string
    sql: ${TABLE}."INTEREST_ACCRUED_ACCOUNTING_METHOD" ;;
  }

  dimension: interest_calculation_balance {
    type: string
    sql: ${TABLE}."INTEREST_CALCULATION_BALANCE" ;;
  }

  dimension: interest_days_in_year {
    type: string
    sql: ${TABLE}."INTEREST_DAYS_IN_YEAR" ;;
  }

  dimension: interest_paid_into_account {
    type: yesno
    sql: ${TABLE}."INTEREST_PAID_INTO_ACCOUNT" ;;
  }

  dimension: interest_payment_point {
    type: string
    sql: ${TABLE}."INTEREST_PAYMENT_POINT" ;;
  }

  dimension: interest_rate_settings {
    type: string
    sql: ${TABLE}."INTEREST_RATE_SETTINGS" ;;
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

  dimension: line_of_credit_requirement {
    type: string
    sql: ${TABLE}."LINE_OF_CREDIT_REQUIREMENT" ;;
  }

  dimension: max_overdraft_limit {
    type: string
    sql: ${TABLE}."MAX_OVERDRAFT_LIMIT" ;;
  }

  dimension: min_opening_balance {
    type: string
    sql: ${TABLE}."MIN_OPENING_BALANCE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: overdraft_days_in_year {
    type: string
    sql: ${TABLE}."OVERDRAFT_DAYS_IN_YEAR" ;;
  }

  dimension: overdraft_interest_rate_settings {
    type: string
    sql: ${TABLE}."OVERDRAFT_INTEREST_RATE_SETTINGS" ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}."PRODUCT_TYPE" ;;
  }

  dimension: savings_fees {
    type: string
    sql: ${TABLE}."SAVINGS_FEES" ;;
  }

  dimension: savings_product_rules {
    type: string
    sql: ${TABLE}."SAVINGS_PRODUCT_RULES" ;;
  }

  dimension: templates {
    type: string
    sql: ${TABLE}."TEMPLATES" ;;
  }

  dimension: withholding_tax_enabled {
    type: yesno
    sql: ${TABLE}."WITHHOLDING_TAX_ENABLED" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
