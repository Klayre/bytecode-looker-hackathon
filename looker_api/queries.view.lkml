view: queries {
  sql_table_name: LOOKER.QUERIES ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Query ID"
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

  dimension: client_id {
    group_label: "Keys/IDs"
    label: "Client ID"
    type: string
    sql: ${TABLE}.CLIENT_ID ;;
  }

  dimension: column_limit {
    label: "Column Limit"
    type: string
    sql: ${TABLE}.COLUMN_LIMIT ;;
  }

  dimension: dynamic_fields {
    group_label: "Table Calcs"
    label: "Dynamic Fields"
    type: string
    sql: ${TABLE}.DYNAMIC_FIELDS ;;
  }

  dimension: expanded_share_url {
    group_label: "URLs"
    label: "Expanded Share URL"
    type: string
    sql: ${TABLE}.EXPANDED_SHARE_URL ;;
  }

  dimension: field {
    group_label: "Fields"
    type: string
    sql: REPLACE(fld.value,'','') ;;
  }

  dimension: fields {
    group_label: "Fields"
    label: "Field JSON"
    type: string
    sql: ${TABLE}.FIELDS ;;
    hidden: yes
  }

  dimension: fields_list {
    group_label: "Fields"
    label: "Fields List"
    type: string
    sql: array_to_string(parse_json(${fields}), ', ') ;;
  }

  dimension: fill_fields {
    group_label: "Fill Fields"
    label: "Fill Fields JSON"
    type: string
    sql: ${TABLE}.FILL_FIELDS ;;
    hidden: yes
  }

  dimension: fill_fields_list {
    group_label: "Fill Fields"
    label: "Fill Fields List"
    type: string
    sql: array_to_string(parse_json(${fill_fields}), ', ') ;;
  }

  dimension: filters {
    group_label: "Filters"
    label: "Filters JSON"
    type: string
    sql: ${TABLE}.FILTERS ;;
    hidden: yes
  }

  dimension: filters_adj {
    group_label: "Filters"
    label: "Filters Adj JSON"
    type: string
    sql: REPLACE(${filters},'": "',': ') ;;
    hidden: yes
  }

  dimension: filters_config {
    group_label: "Filters"
    label: "Filter Config JSON"
    type: string
    sql: ${TABLE}.FILTER_CONFIG ;;
    hidden: yes
  }

  dimension: has_table_calculations {
    label: "Has Table Calculations"
    type: yesno
    sql: ${TABLE}.HAS_TABLE_CALCULATIONS ;;
  }

  dimension: limit {
    label: "Limit Rows"
    type: string
    sql: ${TABLE}."LIMIT" ;;
  }

  dimension: model {
    label: "Model Name"
    type: string
    sql: ${TABLE}.MODEL ;;
  }

  dimension: pivots {
    group_label: "Pivots"
    label: "Pivot Fields JSON"
    type: string
    sql: ${TABLE}.PIVOTS ;;
    hidden: yes
  }

  dimension: pivots_list {
    group_label: "Pivots"
    label: "Pivot Fields List"
    type: string
    sql: array_to_string(parse_json(${pivots}), ', ') ;;
  }

  dimension: query_timezone {
    label: "Query Timezone"
    type: string
    sql: ${TABLE}.QUERY_TIMEZONE ;;
  }

  dimension: row_total {
    label: "Row Total"
    type: string
    sql: ${TABLE}.ROW_TOTAL ;;
  }

  dimension: runtime {
    label: "Runtime"
    type: number
    sql: ${TABLE}.RUNTIME ;;
  }

  dimension: share_url {
    group_label: "URLs"
    label: "Share URL"
    type: string
    sql: ${TABLE}.SHARE_URL ;;
  }

  dimension: slug {
    group_label: "Keys/IDs"
    label: "Query Slug"
    type: string
    sql: ${TABLE}.SLUG ;;
  }

  dimension: sorts {
    group_label: "Sorts"
    label: "Sorts JSON"
    type: string
    sql: ${TABLE}.SORTS ;;
  }

  dimension: sorts_list {
    group_label: "Sorts"
    label: "sorts List"
    type: string
    sql: array_to_string(parse_json(${sorts}), ', ') ;;
  }

  dimension: url {
    group_label: "URLs"
    label: "URL"
    type: string
    sql: ${TABLE}.URL ;;
  }

  dimension: view {
    label: "View Name"
    type: string
    sql: ${TABLE}.VIEW ;;
  }

  dimension: vis_config {
    label: "Vis Config JSON"
    type: string
    sql: ${TABLE}.VIS_CONFIG ;;
    hidden: yes
  }

  dimension: visible_ui_sections {
    label: "Visible UI Sections"
    type: string
    sql: ${TABLE}.VISIBLE_UI_SECTIONS ;;
  }

  measure: count {
    label: "Number of Queries"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      model,
      view,

    ]
  }
}
