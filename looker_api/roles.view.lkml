view: roles {
  view_label: "Roles"
  sql_table_name: LOOKER.ROLES ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Role ID"
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

  dimension: model_set {
    label: "Model Set JSON"
    type: string
    sql: ${TABLE}.MODEL_SET ;;
    hidden: yes
  }

  dimension: model_set_id {
    group_label: "Keys/IDs"
    label: "Model Set ID"
    type: string
    sql: ${model_set}:id::varchar ;;
    hidden: yes
  }

  dimension: name {
    label: "Role Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: permission_set {
    label: "Permission Set JSON"
    type: string
    sql: ${TABLE}.PERMISSION_SET ;;
    hidden: yes
  }

  dimension: permission_set_id {
    group_label: "Keys/IDs"
    label: "Permission Set ID"
    type: string
    sql: ${permission_set}:id::varchar ;;
    hidden: yes
  }

  dimension: url {
    group_label: "URLs"
    label: "URL"
    type: string
    sql: ${TABLE}.URL ;;
  }

  dimension: users_url {
    group_label: "URLs"
    label: "Users URL"
    type: string
    sql: ${TABLE}.USERS_URL ;;
  }

  measure: count {
    label: "Number of Roles"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      permission_sets.id,
      permission_sets.name,
      permission_sets.permissions_list,
      model_sets.id,
      model_sets.name,
      model_sets.models_list,
      url,
      role_groups.count,
      users.count
    ]
  }
}
