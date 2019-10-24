view: content_metadata_access {
  view_label: "Content Metadata Access"
  sql_table_name: LOOKER.CONTENT_METADATA_ACCESS ;;
  drill_fields: [detail*]

  dimension: id {
    label: "Content Metadata Access ID"
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

  dimension: content_metadata_id {
    label: "Content Metadata ID"
    type: string
    sql: ${TABLE}.CONTENT_METADATA_ID ;;
  }

  dimension: group_id {
    label: "Group ID"
    type: string
    sql: ${TABLE}.GROUP_ID ;;
  }

  dimension: permission_type {
    label: "Permission Type"
    type: string
    sql: ${TABLE}.PERMISSION_TYPE ;;
  }

  dimension: user_id {
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    label: "Number of Records"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      permission_type,
      content_metadata.id,
      content_metadata.name,
      groups.id,
      groups.name,
      users.id,
      users.display_name
    ]
  }
}
