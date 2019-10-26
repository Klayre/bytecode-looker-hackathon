view: users {
  label: "Users"
  sql_table_name: LOOKER.USERS ;;
  drill_fields: [detail*]

  dimension: id {
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

  dimension: avatar_url {
    group_label: "URLs"
    label: "Avatar URL"
    type: string
    sql: ${TABLE}.AVATAR_URL ;;
  }

  dimension: credentials_api3 {
    group_label: "Credentials"
    label: "Credentials API3"
    type: string
    sql: ${TABLE}.CREDENTIALS_API3 ;;
  }

  dimension: credentials_email {
    group_label: "Credentials"
    label: "Credentials Email"
    type: string
    sql: ${TABLE}.CREDENTIALS_EMAIL ;;
  }

  dimension: credentials_embed {
    group_label: "Credentials"
    label: "Credentials Embed"
    type: string
    sql: ${TABLE}.CREDENTIALS_EMBED ;;
  }

  dimension: credentials_looker_openid {
    group_label: "Credentials"
    label: "Credentials Looker OpenID"
    type: string
    sql: ${TABLE}.CREDENTIALS_LOOKER_OPENID ;;
  }

  dimension: credentials_totp {
    group_label: "Credentials"
    label: "Credentials TOTP"
    type: string
    sql: ${TABLE}.CREDENTIALS_TOTP ;;
  }

  dimension: display_name {
    label: "Display Name"
    type: string
    sql: ${TABLE}.DISPLAY_NAME ;;
  }

  dimension: email {
    label: "Email"
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: group_ids {
    label: "Group IDs JSON"
    type: string
    sql: ${TABLE}.GROUP_IDS ;;
    hidden: yes
  }

  dimension: home_folder_id {
    group_label: "Keys/IDs"
    label: "Home Folder ID"
    type: string
    sql: ${TABLE}.HOME_FOLDER_ID ;;
  }

  dimension: home_space_id {
    group_label: "Keys/IDs"
    label: "Home Space ID"
    type: string
    sql: ${TABLE}.HOME_SPACE_ID ;;
  }

  dimension: is_disabled {
    label: "Is Disabled"
    type: yesno
    sql: ${TABLE}.IS_DISABLED ;;
  }

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: locale {
    label: "Locale"
    type: string
    sql: ${TABLE}.LOCALE ;;
  }

  dimension: looker_versions {
    label: "Looker Versions JSON"
    type: string
    sql: ${TABLE}.LOOKER_VERSIONS ;;
  }

  dimension: models_dir_validated {
    label: "Models Dir Validated"
    type: yesno
    sql: ${TABLE}.MODELS_DIR_VALIDATED ;;
  }

  dimension: personal_folder_id {
    group_label: "Keys/IDs"
    label: "Personal Folder ID"
    type: string
    sql: ${TABLE}.PERSONAL_FOLDER_ID ;;
  }

  dimension: personal_space_id {
    group_label: "Keys/IDs"
    label: "Personal Space ID"
    type: string
    sql: ${TABLE}.PERSONAL_SPACE_ID ;;
  }

  dimension: presumed_looker_employee {
    label: "Presumed Looker Employee"
    type: yesno
    sql: ${TABLE}.PRESUMED_LOOKER_EMPLOYEE ;;
  }

  dimension: role_ids {
    label: "Group IDs JSON"
    type: string
    sql: ${TABLE}.ROLE_IDS ;;
    hidden: yes
  }

  dimension: roles_externally_managed {
    label: "Role Externally Managed"
    type: yesno
    sql: ${TABLE}.ROLES_EXTERNALLY_MANAGED ;;
  }

  dimension: sessions {
    label: "Sessions JSON"
    type: string
    sql: ${TABLE}.SESSIONS ;;
    hidden: yes
  }

  dimension: ui_state {
    label: "UI State JSON"
    type: string
    sql: ${TABLE}.UI_STATE ;;
    hidden: yes
  }

  dimension: url {
    group_label: "URLs"
    label: "URL"
    type: string
    sql: ${TABLE}.URL ;;
  }

  dimension: verified_looker_employee {
    label: "Verified Looker Employee"
    type: yesno
    sql: ${TABLE}.VERIFIED_LOOKER_EMPLOYEE ;;
  }

  measure: count {
    label: "Number of Users"
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
      email,
      groups.id,
      groups.name,
      roles.id,
      roles.name,
      content_metadata_access.count,
      dashboards.count,
      homepages.count,
      looks.count
    ]
  }
}
