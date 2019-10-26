view: project_files {
  label: "Project Files"
  sql_table_name: LOOKER.PROJECT_FILES ;;
  drill_fields: [detail*]

  dimension: id {
    label: "Project File ID"
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

  dimension: editable {
    label: "Editable"
    type: yesno
    sql: ${TABLE}.EDITABLE ;;
  }

  dimension: extension {
    label: "File Extension"
    type: string
    sql: ${TABLE}.EXTENSION ;;
  }

  dimension: mime_type {
    label: "MIME Type"
    type: string
    sql: ${TABLE}.MIME_TYPE ;;
  }

  dimension: path {
    label: "Path"
    type: string
    sql: ${TABLE}.PATH ;;
  }

  dimension: project_id {
    label: "Project Name"
    type: string
    # hidden: yes
    sql: ${TABLE}.PROJECT_ID ;;
  }

  dimension: title {
    label: "File Title"
    type: string
    sql: ${TABLE}.TITLE ;;
  }

  dimension: type {
    label: "File Type"
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  measure: count {
    label: "Number of Files"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      title,
      path,
      type,
      path,
      project_id
    ]
  }
}
