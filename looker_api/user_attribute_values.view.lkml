view: user_attribute_values {
  view_label: "User Attribute Values"
  sql_table_name: LOOKER.USER_ATTRIBUTE_VALUES ;;
  drill_fields: [detail*]

  dimension: user_attribute_value_pk {
    group_label: "Keys/IDs"
    label: "User Attribute Value PK"
    type: string
    sql: ${user_id} || '-' || ${user_attribute_id} ;;
    hidden: yes
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

  dimension: label {
    label: "User Attribute Label"
    type: string
    sql: ${TABLE}.LABEL ;;
  }

  dimension: name {
    label: "User Attribute Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: rank {
    label: "Rank"
    type: number
    sql: ${TABLE}.RANK ;;
  }

  dimension: source {
    label: "Source"
    type: string
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: user_attribute_id {
    group_label: "Keys/IDs"
    label: "User Attribute ID"
    type: string
    sql: ${TABLE}.USER_ATTRIBUTE_ID ;;
  }

  dimension: user_can_edit {
    label: "User Can Edit"
    type: yesno
    sql: ${TABLE}.USER_CAN_EDIT ;;
  }

  dimension: user_id {
    group_label: "Keys/IDs"
    label: "Use ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  dimension: value {
    label: "User Attribute Value"
    type: string
    sql: ${TABLE}.VALUE ;;
  }

  dimension: value_is_hidden {
    label: "Value is Hidden"
    type: yesno
    sql: ${TABLE}.VALUE_IS_HIDDEN ;;
  }

  measure: count {
    label: "Number of User Attribute Values"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      user_id,
      users.display_name,
      user_attribute_id,
      rank,
      label,
      name,
      source,
      value
    ]
  }
}
