view: git_branches {
  view_label: "Git Branches"
  sql_table_name: LOOKER.GIT_BRANCHES ;;

  dimension: remote_ref {
    label: "Remote Ref"
    type: string
    primary_key: yes
    sql: ${TABLE}.REMOTE_REF ;;
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

  dimension: ahead_count {
    label: "Commits Ahead"
    type: number
    sql: ${TABLE}.AHEAD_COUNT ;;
  }

  dimension: behind_count {
    label: "Commits Behind"
    type: number
    sql: ${TABLE}.BEHIND_COUNT ;;
  }

  dimension_group: commit {
    type: time
    datatype: epoch
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.COMMIT_AT ;;
  }

  dimension: is_local {
    label: "Is Local"
    type: yesno
    sql: ${TABLE}.IS_LOCAL ;;
  }

  dimension: is_production {
    label: "Is Production"
    type: yesno
    sql: ${TABLE}.IS_PRODUCTION ;;
  }

  dimension: is_remote {
    label: "Is Remote"
    type: yesno
    sql: ${TABLE}.IS_REMOTE ;;
  }

  dimension: name {
    label: "Git Branch Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: personal {
    label: "Is Personal"
    type: yesno
    sql: ${TABLE}.PERSONAL ;;
  }

  dimension: project_id {
    label: "Project ID"
    type: string
    sql: ${TABLE}.PROJECT_ID ;;
  }

  dimension: readonly {
    label: "Is Read Only"
    type: yesno
    sql: ${TABLE}.READONLY ;;
  }

  dimension: ref {
    label: "Reference"
    type: string
    sql: ${TABLE}.REF ;;
  }

  dimension: remote {
    label: "Remot"
    type: string
    sql: ${TABLE}.REMOTE ;;
  }

  dimension: remote_name {
    label: "Remote Name"
    type: string
    sql: ${TABLE}.REMOTE_NAME ;;
  }

  measure: count {
    label: "Number of Git Branches"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      remote_ref,
      name,
      commit_time,
      remote_name,
      project_id,
      projects.git_service_name,
      projects.git_username,
      projects.name
    ]
  }
}
