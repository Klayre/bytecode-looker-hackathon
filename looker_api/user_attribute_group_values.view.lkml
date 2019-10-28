view: user_attribute_group_values {
  label: "User Attribute Group Values"
  sql_table_name: LOOKER.USER_ATTRIBUTE_GROUP_VALUES ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "User Attr Group Value ID"
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

  dimension: group_id {
    group_label: "Keys/IDs"
    label: "Group ID"
    type: string
    sql: ${TABLE}.GROUP_ID ;;
  }

  dimension: rank {
    label: "Rank"
    type: number
    sql: ${TABLE}.RANK ;;
  }

  dimension: user_attribute_id {
    group_label: "Keys/IDs"
    label: "User Attribute ID"
    type: string
    sql: ${TABLE}.USER_ATTRIBUTE_ID ;;
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
    label: "Number of User Attr Group Values"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      user_attribute_id,
      user_attributes.name,
      user_attributes.label,
      group_id,
      groups.name,
      rank,
      value
    ]
  }
}
