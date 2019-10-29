view: user_attributes {
  view_label: "User Attributes"
  sql_table_name: LOOKER.USER_ATTRIBUTES ;;
  drill_fields: [detail*]

  dimension: id {
    label: "User Attribute ID"
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

  dimension: default_value {
    label: "Default Value"
    type: string
    sql: ${TABLE}.DEFAULT_VALUE ;;
  }

  dimension: is_system {
    label: "Is System Attr"
    type: yesno
    sql: ${TABLE}.IS_SYSTEM ;;
  }

  dimension: label {
    label: "Label"
    type: string
    sql: ${TABLE}.LABEL ;;
  }

  dimension: name {
    label: "User Attr Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  dimension: user_can_edit {
    label: "User Can Edit"
    type: yesno
    sql: ${TABLE}.USER_CAN_EDIT ;;
  }

  dimension: user_can_view {
    label: "User Can View"
    type: yesno
    sql: ${TABLE}.USER_CAN_VIEW ;;
  }

  dimension: value_is_hidden {
    label: "Value is Hidden"
    type: yesno
    sql: ${TABLE}.VALUE_IS_HIDDEN ;;
  }

  measure: count {
    label: "Number of User Attributes"
    type: count
    drill_fields: [id, name]
  }

  set: detail {
    fields: [
      id,
      name,
      label,
      type,
      default_value
    ]
  }
}
