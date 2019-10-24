view: groups {
  view_label: "Groups"
  sql_table_name: LOOKER.GROUPS ;;
  drill_fields: [detail*]

  dimension: id {
    label: "Group ID"
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

  dimension: can_add_to_content_metadata {
    label: "Can Add to Content Metadata"
    type: yesno
    sql: ${TABLE}.CAN_ADD_TO_CONTENT_METADATA ;;
  }

  dimension: contains_current_user {
    label: "Contains Current User"
    type: yesno
    sql: ${TABLE}.CONTAINS_CURRENT_USER ;;
    hidden: yes
  }

  dimension: externally_managed {
    label: "Is Externally Managed"
    type: yesno
    sql: ${TABLE}.EXTERNALLY_MANAGED ;;
  }

  dimension: include_by_default {
    label: "Include by Default"
    type: yesno
    sql: ${TABLE}.INCLUDE_BY_DEFAULT ;;
  }

  dimension: name {
    label: "Group Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: user_count {
    label: "User Count"
    type: number
    sql: ${TABLE}.USER_COUNT ;;
  }

  measure: count {
    label: "Number of Groups"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      user_count
    ]
  }
}
