view: scheduled_plans {
  view_label: "Scheduled Plans"
  sql_table_name: LOOKER.SCHEDULED_PLANS ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Scheduled Plan ID"
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

  dimension: color_theme {
    label: "Color Theme"
    type: string
    sql: ${TABLE}.COLOR_THEME ;;
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
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: crontab {
    label: "Crontab Schedule"
    type: string
    sql: ${TABLE}.CRONTAB ;;
  }

  dimension: dashboard_filters {
    label: "Dashboard Filters URL Parms"
    type: string
    sql: ${TABLE}.DASHBOARD_FILTERS ;;
  }

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.DASHBOARD_ID ;;
  }

  dimension: embed {
    label: "Is Embed"
    type: yesno
    sql: ${TABLE}.EMBED ;;
  }

  dimension: enabled {
    label: "Is Enabled"
    type: yesno
    sql: ${TABLE}.ENABLED ;;
  }

  dimension: filters_string {
    label: "Filters String"
    type: string
    sql: ${TABLE}.FILTERS_STRING ;;
  }

  dimension: include_links {
    label: "Include Links"
    type: yesno
    sql: ${TABLE}.INCLUDE_LINKS ;;
  }

  dimension_group: last_run {
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
    sql: ${TABLE}.LAST_RUN_AT ;;
  }

  dimension: long_tables {
    label: "Long Tables"
    type: yesno
    sql: ${TABLE}.LONG_TABLES ;;
  }

  dimension: look_id {
    group_label: "Keys/IDs"
    label: "Look ID"
    type: string
    sql: ${TABLE}.LOOK_ID ;;
  }

  dimension: name {
    label: "Scheduled Plans Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension_group: next_run {
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
    sql: ${TABLE}.NEXT_RUN_AT ;;
  }

  dimension: pdf_landscape {
    label: "Is PDF Landscape"
    type: yesno
    sql: ${TABLE}.PDF_LANDSCAPE ;;
  }

  dimension: require_change {
    label: "Require Change"
    type: yesno
    sql: ${TABLE}.REQUIRE_CHANGE ;;
  }

  dimension: require_no_results {
    label: "Require No Results"
    type: yesno
    sql: ${TABLE}.REQUIRE_NO_RESULTS ;;
  }

  dimension: require_results {
    label: "Require Results"
    type: yesno
    sql: ${TABLE}.REQUIRE_RESULTS ;;
  }

  dimension: run_as_recipient {
    label: "Run as Recipient"
    type: yesno
    sql: ${TABLE}.RUN_AS_RECIPIENT ;;
  }

  dimension: run_once {
    label: "Run Once"
    type: yesno
    sql: ${TABLE}.RUN_ONCE ;;
  }

  dimension: scheduled_plan_destination {
    group_item_label: "Schedule Plan Destination"
    type: string
    sql: ${TABLE}.SCHEDULED_PLAN_DESTINATION ;;
  }

  dimension: send_all_results {
    label: "Send All Results"
    type: yesno
    sql: ${TABLE}.SEND_ALL_RESULTS ;;
  }

  dimension: timezone {
    label: "Timezone"
    type: string
    sql: ${TABLE}.TIMEZONE ;;
  }

  dimension: title {
    label: "Scheduled Plan Title"
    type: string
    sql: ${TABLE}.TITLE ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.UPDATED_AT ;;
  }

  dimension: user {
    label: "User JSON"
    type: string
    sql: ${TABLE}.USER ;;
    hidden: yes
  }

  dimension: user_display_name {
    label: "User Display Name"
    type: string
    sql: ${user}:display_name ;;
  }

  dimension: user_id {
    group_label: "Keys/IDs"
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    label: "Number of Scheduled Plans"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      title,
      crontab,
      scheduled_plan_destination,
      user_display_name,
      dashboard.title,
      looks.title,
      created_date,
      last_run_date,
      next_run_date
    ]
  }
}
