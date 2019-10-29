view: spaces {
  sql_table_name: LOOKER.SPACES ;;
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

  dimension: child_count {
    type: number
    sql: ${TABLE}."CHILD_COUNT" ;;
  }

  dimension: content_metadata_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."CONTENT_METADATA_ID" ;;
  }

  dimension: creator_id {
    type: string
    sql: ${TABLE}."CREATOR_ID" ;;
  }

  dimension: is_embed {
    type: yesno
    sql: ${TABLE}."IS_EMBED" ;;
  }

  dimension: is_embed_shared_root {
    type: yesno
    sql: ${TABLE}."IS_EMBED_SHARED_ROOT" ;;
  }

  dimension: is_embed_users_root {
    type: yesno
    sql: ${TABLE}."IS_EMBED_USERS_ROOT" ;;
  }

  dimension: is_personal {
    type: yesno
    sql: ${TABLE}."IS_PERSONAL" ;;
  }

  dimension: is_personal_descendant {
    type: yesno
    sql: ${TABLE}."IS_PERSONAL_DESCENDANT" ;;
  }

  dimension: is_shared_root {
    type: yesno
    sql: ${TABLE}."IS_SHARED_ROOT" ;;
  }

  dimension: is_users_root {
    type: yesno
    sql: ${TABLE}."IS_USERS_ROOT" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: name_button {
      sql: ${name} ;;
      html: <a href="?Parent%20Space={{ spaces.id._value }}"><button style="width:200px;height:40px;font-size:16px;font-weight:bold;">{{rendered_value}}</button></a> ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}."PARENT_ID" ;;
  }

  measure: number_of_children {
    type: sum
    sql: ${child_count} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      content_metadata.id,
      content_metadata.name,
      content_metadata.count,
      looks.count
    ]
  }
}
