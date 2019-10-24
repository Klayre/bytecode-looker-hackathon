view: projects {
  sql_table_name: LOOKER.PROJECTS ;;
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

  dimension: allow_warnings {
    type: yesno
    sql: ${TABLE}."ALLOW_WARNINGS" ;;
  }

  dimension: folders_enabled {
    type: yesno
    sql: ${TABLE}."FOLDERS_ENABLED" ;;
  }

  dimension: git_remote_url {
    type: string
    sql: ${TABLE}."GIT_REMOTE_URL" ;;
  }

  dimension: git_service_name {
    type: string
    sql: ${TABLE}."GIT_SERVICE_NAME" ;;
  }

  dimension: git_username {
    type: string
    sql: ${TABLE}."GIT_USERNAME" ;;
  }

  dimension: is_example {
    type: yesno
    sql: ${TABLE}."IS_EXAMPLE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: pull_request_mode {
    type: string
    sql: ${TABLE}."PULL_REQUEST_MODE" ;;
  }

  dimension: uses_git {
    type: yesno
    sql: ${TABLE}."USES_GIT" ;;
  }

  dimension: validation_required {
    type: yesno
    sql: ${TABLE}."VALIDATION_REQUIRED" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      git_service_name,
      git_username,
      name,
      git_branches.count,
      project_files.count
    ]
  }
}
