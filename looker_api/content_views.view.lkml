view: content_views {
  view_label: "Content Views"
  sql_table_name: LOOKER.CONTENT_VIEWS ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Content View ID"
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

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.DASHBOARD_ID ;;
  }

  dimension: favorite_count {
    group_label: "Numerical Dimensions"
    label: "Favorite Count"
    type: number
    sql: ${TABLE}.FAVORITE_COUNT ;;
  }

  dimension_group: last_viewed {
    type: time
    datatype: timestamp
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TRY_TO_TIMESTAMP(${TABLE}.LAST_VIEWED_AT) ;;
  }

  dimension: look_id {
    group_label: "Keys/IDs"
    label: "Look ID"
    type: string
    sql: ${TABLE}.LOOK_ID ;;
  }

  dimension_group: start_of_week {
    type: time
    datatype: timestamp
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TRY_TO_TIMESTAMP(${TABLE}.START_OF_WEEK_DATE)  ;;
  }

  dimension: user_id {
    group_label: "Keys/IDs"
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  dimension: view_count {
    group_label: "Numerical Dimensions"
    label: "View Count"
    type: number
    sql: ${TABLE}.VIEW_COUNT ;;
  }

  measure: count {
    label: "Number of Content View Records"
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  measure: max_last_view {
    label: "Last Viewed"
    type: date_time
    sql: MAX(${last_viewed_time}) ;;
  }

  measure: min_last_view {
    label: "First Viewed"
    type: date_time
    sql: MIN(${last_viewed_time}) ;;
  }

  measure: total_favorites {
    label: "Total Favorites"
    type: sum
    sql: ${favorite_count} ;;
  }

  measure: total_views {
    label: "Total Views"
    type: sum
    sql: ${view_count} ;;
  }


  set: detail {
    fields: [
      id,
      dashboard_id,
      dashboard.title,
      look_id,
      look.title,
      user.id,
      user.display_name,
      last_viewed_date,
      favorite_count,
      view_count
    ]
  }
}
