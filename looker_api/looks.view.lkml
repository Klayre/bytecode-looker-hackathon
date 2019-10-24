view: looks {
  sql_table_name: LOOKER.LOOKS ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
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
    sql: ${TABLE}."_SDC_BATCHED_AT" ;;
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
    sql: ${TABLE}."_SDC_EXTRACTED_AT" ;;
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
    sql: ${TABLE}."_SDC_RECEIVED_AT" ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}."_SDC_SEQUENCE" ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}."_SDC_TABLE_VERSION" ;;
  }

  dimension: content_metadata_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."CONTENT_METADATA_ID" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}."DELETED" ;;
  }

  dimension: embed_url {
    type: string
    sql: ${TABLE}."EMBED_URL" ;;
  }

  dimension: excel_file_url {
    type: string
    sql: ${TABLE}."EXCEL_FILE_URL" ;;
  }

  dimension: favorite_count {
    type: number
    sql: ${TABLE}."FAVORITE_COUNT" ;;
  }

  dimension: google_spreadsheet_formula {
    type: string
    sql: ${TABLE}."GOOGLE_SPREADSHEET_FORMULA" ;;
  }

  dimension: image_embed_url {
    type: string
    sql: ${TABLE}."IMAGE_EMBED_URL" ;;
  }

  dimension: is_run_on_load {
    type: yesno
    sql: ${TABLE}."IS_RUN_ON_LOAD" ;;
  }

  dimension_group: last_accessed {
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
    sql: ${TABLE}."LAST_ACCESSED_AT" ;;
  }

  dimension: last_updater_id {
    type: string
    sql: ${TABLE}."LAST_UPDATER_ID" ;;
  }

  dimension_group: last_viewed {
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
    sql: ${TABLE}."LAST_VIEWED_AT" ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}."MODEL" ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}."PUBLIC" ;;
  }

  dimension: public_slug {
    type: string
    sql: ${TABLE}."PUBLIC_SLUG" ;;
  }

  dimension: public_url {
    type: string
    sql: ${TABLE}."PUBLIC_URL" ;;
  }

  dimension: query_id {
    type: string
    sql: ${TABLE}."QUERY_ID" ;;
  }

  dimension: short_url {
    type: string
    sql: ${TABLE}."SHORT_URL" ;;
  }

  dimension: space {
    type: string
    sql: ${TABLE}."SPACE" ;;
  }

  dimension: space_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."SPACE_ID" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}."USER" ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: view_count {
    type: number
    sql: ${TABLE}."VIEW_COUNT" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      content_metadata.id,
      content_metadata.name,
      spaces.id,
      spaces.name,
      users.display_name,
      users.first_name,
      users.id,
      users.last_name,
      content_metadata.count,
      dashboard_elements.count
    ]
  }
}
