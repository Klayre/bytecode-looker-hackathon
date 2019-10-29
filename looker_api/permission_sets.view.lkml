view: permission_sets {
  view_label: "Permission Sets"
  sql_table_name: LOOKER.PERMISSION_SETS ;;
  drill_fields: [detail*]

  dimension: id {
    label: "Permission Set ID"
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

  dimension: all_access {
    label: "All Access"
    type: yesno
    sql: ${TABLE}.ALL_ACCESS ;;
  }

  dimension: built_in {
    label: "Built-in"
    type: yesno
    sql: ${TABLE}.BUILT_IN ;;
  }

  dimension: name {
    label: "Permission Set Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: permissions {
    group_label: "Permissions"
    label: "Permissions JSON"
    type: string
    sql: ${TABLE}.PERMISSIONS ;;
    hidden: yes
  }

  dimension: permissions_list {
    group_label: "Permissions"
    label: "Permissions List"
    type: string
    sql: array_to_string(parse_json(${permissions}), ', ') ;;
  }

  dimension: url {
    label: "URL"
    type: string
    sql: ${TABLE}.URL ;;
  }

  measure: count {
    label: "Number of Permission Sets"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      built_in,
      all_access,
      permissions_list
    ]
  }
}
