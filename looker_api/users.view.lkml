view: users {
  sql_table_name: LOOKER.USERS ;;
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

  dimension: avatar_url {
    type: string
    sql: ${TABLE}."AVATAR_URL" ;;
  }

  dimension: credentials_api3 {
    type: string
    sql: ${TABLE}."CREDENTIALS_API3" ;;
  }

  dimension: credentials_email {
    type: string
    sql: ${TABLE}."CREDENTIALS_EMAIL" ;;
  }

  dimension: credentials_embed {
    type: string
    sql: ${TABLE}."CREDENTIALS_EMBED" ;;
  }

  dimension: credentials_looker_openid {
    type: string
    sql: ${TABLE}."CREDENTIALS_LOOKER_OPENID" ;;
  }

  dimension: credentials_totp {
    type: string
    sql: ${TABLE}."CREDENTIALS_TOTP" ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}."DISPLAY_NAME" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: group_ids {
    type: string
    # hidden: yes
    sql: ${TABLE}."GROUP_IDS" ;;
  }

  dimension: home_folder_id {
    type: string
    sql: ${TABLE}."HOME_FOLDER_ID" ;;
  }

  dimension: home_space_id {
    type: string
    sql: ${TABLE}."HOME_SPACE_ID" ;;
  }

  dimension: is_disabled {
    type: yesno
    sql: ${TABLE}."IS_DISABLED" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}."LOCALE" ;;
  }

  dimension: looker_versions {
    type: string
    sql: ${TABLE}."LOOKER_VERSIONS" ;;
  }

  dimension: models_dir_validated {
    type: yesno
    sql: ${TABLE}."MODELS_DIR_VALIDATED" ;;
  }

  dimension: personal_folder_id {
    type: string
    sql: ${TABLE}."PERSONAL_FOLDER_ID" ;;
  }

  dimension: personal_space_id {
    type: string
    sql: ${TABLE}."PERSONAL_SPACE_ID" ;;
  }

  dimension: presumed_looker_employee {
    type: yesno
    sql: ${TABLE}."PRESUMED_LOOKER_EMPLOYEE" ;;
  }

  dimension: role_ids {
    type: string
    # hidden: yes
    sql: ${TABLE}."ROLE_IDS" ;;
  }

  dimension: roles_externally_managed {
    type: yesno
    sql: ${TABLE}."ROLES_EXTERNALLY_MANAGED" ;;
  }

  dimension: sessions {
    type: string
    sql: ${TABLE}."SESSIONS" ;;
  }

  dimension: ui_state {
    type: string
    sql: ${TABLE}."UI_STATE" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
  }

  dimension: verified_looker_employee {
    type: yesno
    sql: ${TABLE}."VERIFIED_LOOKER_EMPLOYEE" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      display_name,
      first_name,
      last_name,
      groups.id,
      groups.name,
      roles.id,
      roles.name,
      connections.count,
      content_metadata_access.count,
      dashboards.count,
      homepages.count,
      looks.count
    ]
  }
}
