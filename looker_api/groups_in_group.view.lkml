view: groups_in_group {
  label: "Groups in Group"
  sql_table_name: LOOKER.GROUPS_IN_GROUP ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
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

  dimension: name {
    label: "Group Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: parent_group_id {
    group_label: "Keys/IDs"
    label: "Parent Group ID"
    type: string
    sql: ${TABLE}.PARENT_GROUP_ID ;;
  }

  dimension: user_count {
    label: "User Count"
    type: number
    sql: ${TABLE}.USER_COUNT ;;
  }

  measure: count {
    label: "Number of Child Groups"
    type: count
    drill_fields: [id, name]
  }

  set: detail {
    fields: [
      id,
      name,
      group.id,
      group.name,
      user_count
    ]
  }
}
