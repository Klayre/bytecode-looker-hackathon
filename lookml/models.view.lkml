view: models {
  sql_table_name: LOOKML.MODELS ;;
  view_label: "Models"

  dimension: model_pk {
    label: "Model PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${git_owner} || '-' || ${git_repository} || '-' || ${path} ;;
  }

  dimension: model_name {
    label: "Model Name"
    type: string
    sql: split_part(split_part(${path}, '.', -3), '/', -1) ;;
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

  dimension: access_grants {
    group_label: "Access Grants"
    label: "Access Grants JSON"
    type: string
    sql: ${TABLE}.ACCESS_GRANTS ;;
    hidden: yes
  }

  dimension: case_sensitive {
    label: "Case Sensitive"
    type: string
    sql: ${TABLE}.CASE_SENSITIVE ;;
  }

  dimension: case_sensitive_yn {
    label: "Is Case Sensitive"
    type: yesno
    sql: ${TABLE}.CASE_SENSITIVE = 'yes' ;;
  }

  dimension: connection {
    label: "Connection"
    type: string
    sql: ${TABLE}.CONNECTION ;;
  }

  dimension: datagroups {
    group_label: "Datagroups"
    label: "Datgroups JSON"
    type: string
    sql: ${TABLE}.DATAGROUPS ;;
    hidden: yes
  }

  dimension: explores {
    label: "Explores JSON"
    type: string
    sql: ${TABLE}.EXPLORES ;;
    hidden: yes
  }

  dimension: fiscal_month_offset {
    group_item_label: "Fiscal Month Offset"
    type: number
    sql: ${TABLE}.FISCAL_MONTH_OFFSET::INT ;;
  }

  dimension: git_owner {
    group_label: "Git"
    label: "Git Owner"
    type: string
    sql: ${TABLE}.GIT_OWNER ;;
  }

  dimension: git_repository {
    group_label: "Git"
    label: "Git Repository"
    type: string
    sql: ${TABLE}.GIT_REPOSITORY ;;
  }

  dimension: includes {
    group_label: "Includes"
    label: "Includes"
    type: string
    sql: ${TABLE}.INCLUDES ;;
    hidden: yes
  }

  dimension: includes_list {
    group_label: "Includes"
    label: "Includes List"
    type: string
    sql:array_to_string(parse_json(${includes}), ', ') ;;
  }

  dimension: label {
    label: "Label"
    type: string
    sql: ${TABLE}.LABEL ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.LAST_MODIFIED ;;
  }

  dimension: map_layers {
    group_label: "Map Layers"
    label: "Map Layers JSON"
    type: string
    sql: ${TABLE}.MAP_LAYERS ;;
    hidden: yes
  }

  dimension: named_value_formats {
    group_label: "Named Value Formats"
    label: "Named Value Formats JSON"
    type: string
    sql: ${TABLE}.NAMED_VALUE_FORMATS ;;
    hidden: yes
  }

  dimension: path {
    group_label: "Git"
    label: "Model Path"
    type: string
    sql: ${TABLE}.PATH ;;
  }

  dimension: persist_for {
    group_label: "Persist"
    label: "Persist For"
    type: string
    sql: ${TABLE}.PERSIST_FOR ;;
  }

  dimension: persist_with {
    group_label: "Persist"
    label: "Persist With"
    type: string
    sql: ${TABLE}.PERSIST_WITH ;;
  }

  dimension: sha {
    group_label: "Git"
    label: "Model SHA"
    description: "Unique hash key based on file contents"
    type: string
    sql: ${TABLE}.SHA ;;
  }

  dimension: week_start_day {
    label: "Week Start Day"
    type: string
    sql: ${TABLE}.WEEK_START_DAY ;;
  }

  measure: count {
    label: "Number of Models"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      path,
      last_modified_time,
      connection,
      label,
      week_start_day,
      persist_for,
      persist_with
    ]
  }

}
