view: dashboard_elements {
  view_label: "Dashboard Elements"
  sql_table_name: LOOKER.DASHBOARD_ELEMENTS ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Dashboard Element ID"
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

  dimension: body_text {
    label: "Body Text"
    type: string
    sql: ${TABLE}.BODY_TEXT ;;
  }

  dimension: body_text_as_html {
    label: "Body Text HTML"
    type: string
    sql: ${TABLE}.BODY_TEXT_AS_HTML ;;
  }

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.DASHBOARD_ID ;;
  }

  dimension: look {
    label: "Look JSON"
    type: string
    sql: ${TABLE}.LOOK ;;
  }

  dimension: look_id {
    group_label: "Keys/IDs"
    label: "Look ID"
    type: string
    sql: ${TABLE}.LOOK_ID ;;
  }

  dimension: lookml_link_id {
    group_label: "Keys/IDs"
    label: "LookML Link ID"
    type: string
    sql: ${TABLE}.LOOKML_LINK_ID ;;
  }

  dimension: merge_result_id {
    group_label: "Keys/IDs"
    label: "Merge Result ID"
    type: string
    sql: ${TABLE}.MERGE_RESULT_ID ;;
  }

  dimension: query {
    label: "Query JSON"
    type: string
    sql: ${TABLE}.QUERY ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Keys/IDs"
    label: "Query ID"
    type: string
    sql: ${TABLE}.QUERY_ID ;;
  }

  dimension: result_maker {
    label: "Result Maker JSON"
    type: string
    sql: ${TABLE}.RESULT_MAKER ;;
    hidden: yes
  }

  dimension: result_maker_id {
    group_label: "Keys/IDs"
    label: "Result Maker ID"
    type: string
    sql: ${TABLE}.RESULT_MAKER_ID ;;
  }

  dimension: subtitle_text {
    label: "Subtitle Text"
    type: string
    sql: ${TABLE}.SUBTITLE_TEXT ;;
  }

  dimension: title {
    label: "Title"
    type: string
    sql: ${TABLE}.TITLE ;;
  }

  dimension: title_hidden {
    label: "Is Title Hidden"
    type: yesno
    sql: ${TABLE}.TITLE_HIDDEN ;;
  }

  dimension: title_text {
    label: "Title Text"
    type: string
    sql: ${TABLE}.TITLE_TEXT ;;
  }

  dimension: type {
    label: "Element Type"
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  # MEASURES
  measure: count {
    label: "Number of Dashboard Elements"
    type: count
    drill_fields: [detail*]
  }

  measure: count_vis {
    label: "Number of Vis Elements"
    type: count
    drill_fields: [detail*]
    filters: {
      field: type
      value: "vis"
    }
  }

  measure: count_data {
    label: "Number of Data Elements"
    type: count
    drill_fields: [detail*]
    filters: {
      field: type
      value: "data"
    }
  }

  measure: count_text {
    label: "Number of Text Elements"
    type: count
    drill_fields: [detail*]
    filters: {
      field: type
      value: "text"
    }
  }

  set: detail {
    fields: [
      id,
      title,
      type
    ]
  }
}
