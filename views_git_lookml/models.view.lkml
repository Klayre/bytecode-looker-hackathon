view: models {
  sql_table_name: LOOKML.MODELS ;;
  view_label: "Models"

  dimension: model_pk {
    label: "Model PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${sha} || '-' || ${path} ;;
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
    group_label: "YesNo"
    label: "Case Sensitive"
    type: yesno
    sql: ${TABLE}.CASE_SENSITIVE = 'yes' ;;
  }

  dimension: connection {
    label: "Connection"
    type: string
    sql: ${TABLE}.CONNECTION ;;
  }

  dimension: datagroups {
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

  dimension: includes {
    label: "Includes List"
    type: string
    sql: ${TABLE}.INCLUDES ;;
    hidden: yes
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
    label: "Map Layers JSON"
    type: string
    sql: ${TABLE}.MAP_LAYERS ;;
    hidden: yes
  }

  dimension: map_layers__extents_json_url {
    group_label: "Map Layers"
    label: "Extents JSON URL"
    type: string
    sql: ${map_layers}:extents_json_url ;;
  }

  dimension: map_layers__feature_key {
    group_label: "Map Layers"
    label: "Feature Key"
    type: string
    sql: ${map_layers}:feature_key ;;
  }

  dimension: map_layers__file {
    group_label: "Map Layers"
    label: "File"
    type: string
    sql: ${map_layers}:file ;;
  }

  dimension: map_layers__format {
    group_label: "Map Layers"
    label: "Format"
    type: string
    sql: ${map_layers}:format ;;
  }

  dimension: map_layers__label {
    group_label: "Map Layers"
    label: "Label"
    type: string
    sql: ${map_layers}:label ;;
  }

  dimension: map_layers__max_zoom_level {
    group_label: "Map Layers"
    label: "Max Zoom Level"
    type: string
    sql: ${map_layers}:max_zoom_level ;;
  }

  dimension: map_layers__min_zoom_level {
    group_label: "Map Layers"
    label: "Min Zooom Level"
    type: string
    sql: ${map_layers}:min_zoom_level ;;
  }

  dimension: map_layers__name {
    group_label: "Map Layers"
    label: "Map Layer Name"
    type: string
    sql: ${map_layers}:name ;;
  }

  dimension: map_layers__projection {
    group_label: "Map Layers"
    label: "Projection"
    type: string
    sql: ${map_layers}:projection ;;
  }

  dimension: map_layers__property_key {
    group_label: "Map Layers"
    label: "Property Key"
    type: string
    sql: ${map_layers}:property_key ;;
  }

  dimension: map_layers__property_label_key {
    group_label: "Map Layers"
    label: "Property Label Key"
    type: string
    sql: ${map_layers}:property_label_key ;;
  }

  dimension: map_layers__url {
    group_label: "Map Layers"
    label: "Map Layer URL"
    type: string
    sql: ${map_layers}:url ;;
  }

  dimension: named_value_formats {
    label: "Named Value Formats JSON"
    type: string
    sql: ${TABLE}.NAMED_VALUE_FORMATS ;;
    hidden: yes
  }

  dimension: path {
    label: "Model Path"
    type: string
    sql: ${TABLE}.PATH ;;
  }

  dimension: persist_for {
    label: "Persist For"
    type: string
    sql: ${TABLE}.PERSIST_FOR ;;
  }

  dimension: persist_with {
    label: "Persist With"
    type: string
    sql: ${TABLE}.PERSIST_WITH ;;
  }

  dimension: sha {
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
