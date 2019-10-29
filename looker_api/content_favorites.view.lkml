view: content_favorites {
  view_label: "Content Favorites"
  sql_table_name: LOOKER.CONTENT_FAVORITES ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Content Favorite ID"
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
    group_label: "Keys/IDs"
    label: "Content Metadata ID"
    type: string
    sql: ${TABLE}.CONTENT_METADATA_ID ;;
  }

  dimension: dashboard {
    label: "Dashboard JSON"
    type: string
    sql: ${TABLE}.DASHBOARD ;;
    hidden: yes
  }

  dimension: dashboard_title {
    label: "Dashboard Title"
    type: string
    sql: ${dashboard}:title ;;
  }

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.DASHBOARD_ID ;;
  }

  dimension: look {
    label: "Look JSON"
    type: string
    sql: ${TABLE}.LOOK ;;
    hidden: yes
  }

  dimension: look_title {
    label: "Look Title"
    type: string
    sql: ${look}:title ;;
  }

  dimension: look_id {
    group_label: "Keys/IDs"
    label: "Look ID"
    type: string
    sql: ${TABLE}.LOOK_ID ;;
  }

  dimension: user_id {
    group_label: "Keys/IDs"
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    label: "Number of Favorites"
    type: count
    drill_fields: [id]
  }

  set: detail {
    fields: [
      id,
      dashboard_id,
      dashboard_title,
      look_id,
      look_title,
      user.id,
      user.display_name
    ]
  }
}
