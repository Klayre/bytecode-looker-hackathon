view: query_history {
  view_label: "Query History"
  sql_table_name: LOOKER.QUERY_HISTORY ;;
  drill_fields: [detail*]

  dimension: query_history_pk {
    group_label: "Keys/IDs"
    label: "Query History PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${history_created_date} || '-' || ${dims_hash_key} ;;
    hidden: yes
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

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.DASHBOARD_ID ;;
  }

  dimension: dims_hash_key {
    group_label: "Keys/IDs"
    label: "Dimensions Hash Key"
    type: string
    sql: ${TABLE}.DIMS_HASH_KEY ;;
    hidden: yes
  }

  dimension_group: query {
    type: time
    datatype: date
    convert_tz: no
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TRY_TO_DATE(${history_created_date}) ;;
  }

  dimension: history_created_date {
    type: string
    sql: ${TABLE}.HISTORY_CREATED_DATE ;;
    hidden: yes
  }

  dimension: history_query_run_count {
    group_label: "Numerical Dimensions"
    label: "Query Run Count"
    type: number
    sql: ${TABLE}.HISTORY_QUERY_RUN_COUNT ;;
  }

  dimension: history_total_runtime {
    group_label: "Numerical Dimensions"
    label: "Query Run Count"
    type: number
    sql: ${TABLE}.HISTORY_TOTAL_RUNTIME ;;
  }

  dimension: look_id {
    group_label: "Keys/IDs"
    label: "Look ID"
    type: string
    sql: ${TABLE}.LOOK_ID ;;
  }

  dimension: query_id {
    group_label: "Keys/IDs"
    label: "Query ID"
    type: string
    sql: ${TABLE}.QUERY_ID ;;
  }

  dimension: query_model {
    label: "Model Name"
    type: string
    sql: ${TABLE}.QUERY_MODEL ;;
  }

  dimension: query_view {
    label: "View Name"
    type: string
    sql: ${TABLE}.QUERY_VIEW ;;
  }

  dimension: space_id {
    group_label: "Keys/IDs"
    label: "Space ID"
    type: string
    sql: ${TABLE}.SPACE_ID ;;
  }

  dimension: user_id {
    group_label: "Keys/IDs"
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }


  # MEASURES
  measure: avg_runtime {
    label: "Average Runtime (s)"
    type: number
    value_format_name: decimal_1
    sql: 1.0 * ${total_runtime} / nullif(${total_run_count}, 0)  ;;
    drill_fields: [detail*]
  }

  measure: count {
    label: "Number of Records"
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  measure: count_dashboards {
    label: "Number of Distinct Dashboards Queried"
    type: count_distinct
    sql: ${dashboard_id} ;;
    drill_fields: [detail*]
  }

  measure: count_looks {
    label: "Number of Distinct Looks Queried"
    type: count_distinct
    sql: ${look_id} ;;
    drill_fields: [detail*]
  }

  measure: count_users {
    label: "Number of Distinct Users Querying"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [detail*]
  }

  measure: total_run_count {
    label: "Total Queries Run"
    type: sum
    value_format_name: decimal_0
    sql: ${history_query_run_count} ;;
    drill_fields: [detail*]
  }

  measure: total_runtime {
    label: "Total Runtime (s)"
    type: sum
    value_format_name: decimal_1
    sql: ${history_total_runtime} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      query_id,
      query_date,
      user_id,
      users.display_name,
      query_model,
      query_view,
      space_id,
      spaces.name,
      dashboard_id,
      dashboards.title,
      look_id,
      looks.title,
      history_query_run_count,
      history_total_runtime
    ]
  }
}
