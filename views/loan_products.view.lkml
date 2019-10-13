view: loan_products {
  sql_table_name: MAMBU_BETA.LOAN_PRODUCTS ;;
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

  dimension: account_initial_state {
    type: string
    sql: ${TABLE}."ACCOUNT_INITIAL_STATE" ;;
  }

  dimension: account_linking_enabled {
    type: yesno
    sql: ${TABLE}."ACCOUNT_LINKING_ENABLED" ;;
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

  dimension: amortization_method {
    type: string
    sql: ${TABLE}."AMORTIZATION_METHOD" ;;
  }

  dimension: auto_create_linked_accounts {
    type: yesno
    sql: ${TABLE}."AUTO_CREATE_LINKED_ACCOUNTS" ;;
  }

  dimension: auto_link_accounts {
    type: yesno
    sql: ${TABLE}."AUTO_LINK_ACCOUNTS" ;;
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

  dimension: days_in_year {
    type: string
    sql: ${TABLE}."DAYS_IN_YEAR" ;;
  }

  dimension: default_loan_amount {
    type: string
    sql: ${TABLE}."DEFAULT_LOAN_AMOUNT" ;;
  }

  dimension: default_num_installments {
    type: number
    sql: ${TABLE}."DEFAULT_NUM_INSTALLMENTS" ;;
  }

  dimension: default_principal_repayment_interval {
    type: number
    sql: ${TABLE}."DEFAULT_PRINCIPAL_REPAYMENT_INTERVAL" ;;
  }

  dimension: default_repayment_period_count {
    type: number
    sql: ${TABLE}."DEFAULT_REPAYMENT_PERIOD_COUNT" ;;
  }

  dimension: encoded_key {
    type: string
    sql: ${TABLE}."ENCODED_KEY" ;;
  }

  dimension: for_hybrid_groups {
    type: yesno
    sql: ${TABLE}."FOR_HYBRID_GROUPS" ;;
  }

  dimension: for_individuals {
    type: yesno
    sql: ${TABLE}."FOR_INDIVIDUALS" ;;
  }

  dimension: for_pure_groups {
    type: yesno
    sql: ${TABLE}."FOR_PURE_GROUPS" ;;
  }

  dimension: future_payments_acceptance {
    type: string
    sql: ${TABLE}."FUTURE_PAYMENTS_ACCEPTANCE" ;;
  }

  dimension: grace_period_type {
    type: string
    sql: ${TABLE}."GRACE_PERIOD_TYPE" ;;
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

  dimension: interest_application_method {
    type: string
    sql: ${TABLE}."INTEREST_APPLICATION_METHOD" ;;
  }

  dimension: interest_balance_calculation_method {
    type: string
    sql: ${TABLE}."INTEREST_BALANCE_CALCULATION_METHOD" ;;
  }

  dimension: interest_calculation_method {
    type: string
    sql: ${TABLE}."INTEREST_CALCULATION_METHOD" ;;
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

  dimension: late_payments_recalculation_method {
    type: string
    sql: ${TABLE}."LATE_PAYMENTS_RECALCULATION_METHOD" ;;
  }

  dimension: line_of_credit_requirement {
    type: string
    sql: ${TABLE}."LINE_OF_CREDIT_REQUIREMENT" ;;
  }

  dimension: loan_fees {
    type: string
    sql: ${TABLE}."LOAN_FEES" ;;
  }

  dimension: loan_penalty_calculation_method {
    type: string
    sql: ${TABLE}."LOAN_PENALTY_CALCULATION_METHOD" ;;
  }

  dimension: loan_product_rules {
    type: string
    sql: ${TABLE}."LOAN_PRODUCT_RULES" ;;
  }

  dimension: loan_product_type {
    type: string
    sql: ${TABLE}."LOAN_PRODUCT_TYPE" ;;
  }

  dimension: max_number_of_disbursement_tranches {
    type: number
    sql: ${TABLE}."MAX_NUMBER_OF_DISBURSEMENT_TRANCHES" ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}."PAYMENT_METHOD" ;;
  }

  dimension: prepayment_acceptance {
    type: string
    sql: ${TABLE}."PREPAYMENT_ACCEPTANCE" ;;
  }

  dimension: product_description {
    type: string
    sql: ${TABLE}."PRODUCT_DESCRIPTION" ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}."PRODUCT_NAME" ;;
  }

  dimension: product_security_settings {
    type: string
    sql: ${TABLE}."PRODUCT_SECURITY_SETTINGS" ;;
  }

  dimension: repayment_allocation_order {
    type: string
    sql: ${TABLE}."REPAYMENT_ALLOCATION_ORDER" ;;
  }

  dimension: repayment_currency_rounding {
    type: string
    sql: ${TABLE}."REPAYMENT_CURRENCY_ROUNDING" ;;
  }

  dimension: repayment_elements_rounding_method {
    type: string
    sql: ${TABLE}."REPAYMENT_ELEMENTS_ROUNDING_METHOD" ;;
  }

  dimension: repayment_period_unit {
    type: string
    sql: ${TABLE}."REPAYMENT_PERIOD_UNIT" ;;
  }

  dimension: repayment_rescheduling_method {
    type: string
    sql: ${TABLE}."REPAYMENT_RESCHEDULING_METHOD" ;;
  }

  dimension: repayment_schedule_edit_options {
    type: string
    sql: ${TABLE}."REPAYMENT_SCHEDULE_EDIT_OPTIONS" ;;
  }

  dimension: repayment_schedule_method {
    type: string
    sql: ${TABLE}."REPAYMENT_SCHEDULE_METHOD" ;;
  }

  dimension: rounding_repayment_schedule_method {
    type: string
    sql: ${TABLE}."ROUNDING_REPAYMENT_SCHEDULE_METHOD" ;;
  }

  dimension: schedule_due_dates_method {
    type: string
    sql: ${TABLE}."SCHEDULE_DUE_DATES_METHOD" ;;
  }

  dimension: schedule_interest_days_count_method {
    type: string
    sql: ${TABLE}."SCHEDULE_INTEREST_DAYS_COUNT_METHOD" ;;
  }

  dimension: settlement_options {
    type: string
    sql: ${TABLE}."SETTLEMENT_OPTIONS" ;;
  }

  dimension: taxes_on_fees_enabled {
    type: yesno
    sql: ${TABLE}."TAXES_ON_FEES_ENABLED" ;;
  }

  dimension: taxes_on_interest_enabled {
    type: yesno
    sql: ${TABLE}."TAXES_ON_INTEREST_ENABLED" ;;
  }

  dimension: taxes_on_penalty_enabled {
    type: yesno
    sql: ${TABLE}."TAXES_ON_PENALTY_ENABLED" ;;
  }

  dimension: templates {
    type: string
    sql: ${TABLE}."TEMPLATES" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_name]
  }
}
