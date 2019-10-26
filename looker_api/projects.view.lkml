view: projects {
  view_label: "Projects"
  sql_table_name: LOOKER.PROJECTS ;;
  drill_fields: [detail*]

  dimension: id {
    label: "Project ID"
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

  dimension: allow_warnings {
    label: "Allow Warnings"
    type: yesno
    sql: ${TABLE}.ALLOW_WARNINGS ;;
  }

  dimension: folders_enabled {
    label: "Folders Enabled"
    type: yesno
    sql: ${TABLE}.FOLDERS_ENABLED ;;
  }

  dimension: git_remote_url {
    label: "Git Remote URL"
    type: string
    sql: ${TABLE}.GIT_REMOTE_URL ;;
  }

  dimension: git_service_name {
    label: "Git Service Name"
    type: string
    sql: ${TABLE}.GIT_SERVICE_NAME ;;
  }

  dimension: git_username {
    label: "Git Username"
    type: string
    sql: ${TABLE}.GIT_USERNAME ;;
  }

  dimension: is_example {
    label: "Is Example"
    type: yesno
    sql: ${TABLE}.IS_EXAMPLE ;;
  }

  dimension: name {
    label: "Project Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: pull_request_mode {
    label: "Pull Request Mode"
    type: string
    sql: ${TABLE}.PULL_REQUEST_MODE ;;
  }

  dimension: uses_git {
    label: "Uses Git"
    type: yesno
    sql: ${TABLE}.USES_GIT ;;
  }

  dimension: validation_required {
    label: "Validation Required"
    type: yesno
    sql: ${TABLE}.VALIDATION_REQUIRED ;;
  }

  measure: count {
    label: "Number of Projects"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      git_service_name,
      git_username,
      git_branches.count,
      project_files.count,
      lookml_models.count,
      explores.count
    ]
  }
}
