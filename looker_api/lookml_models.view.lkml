view: lookml_models {
  view_label: "LookML Models"
  sql_table_name: LOOKER.LOOKML_MODELS ;;

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

  dimension: allowed_db_connection_names {
    label: "Allowed DB Connections JSON"
    type: string
    sql: ${TABLE}.ALLOWED_DB_CONNECTION_NAMES ;;
    hidden: yes
  }

  dimension: allowed_db_connections_list {
    label: "Allowed DB Connections List"
    type: string
    sql: array_to_string(parse_json(${allowed_db_connection_names}), ', ') ;;
  }

  dimension: explores {
    label: "Explores JSON"
    type: string
    sql: ${TABLE}.EXPLORES ;;
    hidden: yes
  }

  dimension: has_content {
    label: "Has Content"
    type: yesno
    sql: ${TABLE}.HAS_CONTENT ;;
  }

  dimension: label {
    label: "Label"
    type: string
    sql: ${TABLE}.LABEL ;;
  }

  dimension: name {
    label: "LookML Model Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: project_name {
    label: "Project Name"
    type: string
    sql: ${TABLE}.PROJECT_NAME ;;
  }

  dimension: unlimited_db_connections {
    label: "Unlimited DB Connections"
    type: yesno
    sql: ${TABLE}.UNLIMITED_DB_CONNECTIONS ;;
  }

  measure: count {
    label: "Number of LookML Models"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      name,
      label,
      project_name,
      allowed_db_connections_list
    ]
  }
}
