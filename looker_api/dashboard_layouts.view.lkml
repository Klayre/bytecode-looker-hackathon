view: dashboard_layouts {
  view_label: "Dashboard Layouts"
  sql_table_name: LOOKER.DASHBOARD_LAYOUTS ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Dashboard Layout ID"
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

  dimension: active {
    label: "Is Active"
    type: yesno
    sql: ${TABLE}.ACTIVE ;;
  }

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.DASHBOARD_ID ;;
  }

  dimension: dashboard_layout_components {
    label: "Dashboard Layout Components JSON"
    type: string
    sql: ${TABLE}.DASHBOARD_LAYOUT_COMPONENTS ;;
  }

  dimension: dashboard_title {
    label: "Dashboard Title"
    type: string
    sql: ${TABLE}.DASHBOARD_TITLE ;;
  }

  dimension: deleted {
    label: "Is Deleted"
    type: yesno
    sql: ${TABLE}.DELETED ;;
  }

  dimension: type {
    label: "Layout Type"
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  measure: count {
    label: "Number of Dashboard Layouts"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      dashboard_title,
      type,
      active,
      deleted
    ]
  }
}
