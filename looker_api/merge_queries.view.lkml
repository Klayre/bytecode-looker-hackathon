view: merge_queries {
  view_label: "Merge Queries"
  sql_table_name: LOOKER.MERGE_QUERIES ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Merge Query ID"
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

  dimension: pivots {
    label: "Pivots JSON"
    type: string
    sql: ${TABLE}.PIVOTS ;;
    hidden: yes
  }

  dimension: pivots_list {
    label: "Pivots List"
    type: string
    sql: array_to_string(parse_json(${pivots}), ', ') ;;
  }

  dimension: result_maker_id {
    group_label: "Keys/IDs"
    label: "Result Maker ID"
    type: string
    sql: ${TABLE}.RESULT_MAKER_ID ;;
  }

  dimension: source_queries {
    label: "Source Queries JSON"
    type: string
    sql: ${TABLE}.SOURCE_QUERIES ;;
    hidden: yes
  }

  dimension: total {
    label: "Is Total"
    type: yesno
    sql: ${TABLE}.TOTAL ;;
  }

  dimension: vis_config {
    label: "Vis Config JSON"
    type: string
    sql: ${TABLE}.VIS_CONFIG ;;
    hidden: yes
  }

  measure: count {
    label: "Number of Merge Queries"
    type: count
    drill_fields: [id]
  }

  set: detail {
    fields: [
      id
    ]
  }
}
