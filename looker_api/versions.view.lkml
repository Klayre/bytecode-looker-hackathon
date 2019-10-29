view: versions {
  view_label: "Versions"
  sql_table_name: LOOKER.VERSIONS ;;

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

  dimension: current_version {
    label: "Current Version"
    type: string
    sql: ${TABLE}.CURRENT_VERSION ;;
  }

  dimension: looker_release_version {
    label: "Looker Release Version"
    type: string
    sql: ${TABLE}.LOOKER_RELEASE_VERSION ;;
  }

  dimension: supported_versions {
    label: "Supported Versions JSON"
    type: string
    sql: ${TABLE}.SUPPORTED_VERSIONS ;;
    hidden: yes
  }

}
