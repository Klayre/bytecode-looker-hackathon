view: connections {
  view_label: "Connections"
  sql_table_name: LOOKER.CONNECTIONS ;;
  drill_fields: [detail*]

  dimension: name {
    label: "Connection Name"
    type: string
    primary_key: yes
    sql: ${TABLE}.NAME ;;
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
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT::DATETIME ;;
  }


  dimension: database {
    label: "Datebase"
    type: string
    sql: ${TABLE}.DATABASE ;;
  }

  dimension: db_timezone {
    label: "DB Timezone"
    type: string
    sql: ${TABLE}.DB_TIMEZONE ;;
  }

  dimension: dialect {
    label: "Dialect JSON"
    type: string
    sql: ${TABLE}.DIALECT ;;
    hidden: yes
  }

  dimension: dialect_name {
    label: "Dialect Name"
    type: string
    sql: ${TABLE}.DIALECT_NAME ;;
  }

  dimension: host {
    label: "Host"
    type: string
    sql: ${TABLE}.HOST ;;
  }

  dimension: jdbc_additional_params {
    label: "JDBC Additionall Params"
    type: string
    sql: ${TABLE}.JDBC_ADDITIONAL_PARAMS ;;
  }

  dimension_group: last_reap {
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
    sql: ${TABLE}.LAST_REAP_AT ;;
  }

  dimension_group: last_regen {
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
    sql: ${TABLE}.LAST_REGEN_AT ;;
  }

  dimension: max_billing_gigabytes {
    label: "Max Billing GB"
    type: number
    sql: ${TABLE}.MAX_BILLING_GIGABYTES ;;
  }

  dimension: max_connections {
    label: "Max Connections"
    type: number
    sql: ${TABLE}.MAX_CONNECTIONS ;;
  }

  dimension: pool_timeout {
    label: "Pool Timeout"
    type: number
    sql: ${TABLE}.POOL_TIMEOUT ;;
  }

  dimension: port {
    label: "Port"
    type: string
    sql: ${TABLE}.PORT ;;
  }

  dimension: query_timezone {
    label: "Query Timezone"
    type: string
    sql: ${TABLE}.QUERY_TIMEZONE ;;
  }

  dimension: schema {
    label: "Default Schema"
    type: string
    sql: ${TABLE}.SCHEMA ;;
  }

  dimension: snippets {
    label: "Snippets JSON"
    type: string
    sql: ${TABLE}.SNIPPETS ;;
    hidden: yes
  }

  dimension: sql_runner_precache_tables {
    label: "SQL Runner Precache Tables"
    type: yesno
    sql: ${TABLE}.SQL_RUNNER_PRECACHE_TABLES ;;
  }

  dimension: ssl {
    label: "Is SSL"
    type: yesno
    sql: ${TABLE}.SSL ;;
  }

  dimension: tmp_db_name {
    label: "Temp DB Name"
    type: string
    sql: ${TABLE}.TMP_DB_NAME ;;
  }

  dimension: user_attribute_fields {
    label: "User Attribute Fields"
    type: string
    sql: ${TABLE}.USER_ATTRIBUTE_FIELDS ;;
  }

  dimension: user_id {
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  dimension: username {
    label: "Username"
    type: string
    sql: ${TABLE}.USERNAME ;;
  }

  dimension: uses_oauth {
    label: "Uses OAuth"
    type: yesno
    sql: ${TABLE}.USES_OAUTH ;;
  }

  dimension: verify_ssl {
    label: "Verify SSL"
    type: yesno
    sql: ${TABLE}.VERIFY_SSL ;;
  }

  measure: count {
    label: "Number of Connections"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      name,
      dialect_name,
      username,
      host,
      port,
      database,
      tmp_db_name,
      users.display_name,
      created_date
    ]
  }
}
