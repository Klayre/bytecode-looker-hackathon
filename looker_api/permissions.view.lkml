view: permissions {
  sql_table_name: LOOKER.PERMISSIONS ;;

  dimension: permission {
    label: "Permission"
    type: string
    primary_key: yes
    sql: ${TABLE}.PERMISSION ;;
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

  dimension: description {
    label: "Permission Description"
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: parent {
    label: "Parent"
    type: string
    sql: ${TABLE}.PARENT ;;
  }

  measure: count {
    label: "Number of Permissions"
    type: count
    drill_fields: [permission, description]
  }
}
