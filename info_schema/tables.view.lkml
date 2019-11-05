view: tables {
  view_label: "Tables"
  sql_table_name: @{info_schema_db}.INFORMATION_SCHEMA.TABLES ;;

  dimension: table_pk {
    label: "Table PK"
    type: string
    sql: ${table_catalog} || '.' || ${table_schema} || '.' || ${table_name} ;;
    hidden: yes
  }

  dimension: catalog_schema_name {
    label: "Catalog.Schema Name"
    type: string
    sql: ${table_catalog} || '.' || ${table_schema} ;;
  }

  dimension: schema_table_name {
    label: "Schema.Table Name"
    type: string
    sql: ${table_schema} || '.' || ${table_name} ;;
  }

  dimension: auto_clustering_on {
    label: "Auto Clustering On"
    type: string
    sql: ${TABLE}.AUTO_CLUSTERING_ON ;;
  }

  dimension: bytes {
    group_label: "Size"
    label: "Bytes"
    type: number
    sql: ${TABLE}.BYTES ;;
  }

  dimension: kilobytes {
    group_label: "Size"
    label: "Kilobytes"
    type: number
    sql: ${bytes} / 1024 ;;
  }

  dimension: megabytes {
    group_label: "Size"
    label: "Megabytes"
    type: number
    sql: ${kilobytes} / 1024 ;;
  }

  dimension: gigagbytes {
    group_label: "Size"
    label: "Gigabytes"
    type: number
    sql: ${megabytes} / 1024 ;;
  }

  dimension: clustering_key {
    label: "Clustering Key"
    type: string
    sql: ${TABLE}.CLUSTERING_KEY ;;
  }

  dimension: comment {
    label: "Table Comment"
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: commit_action {
    label: "Commit Action"
    type: string
    sql: ${TABLE}.COMMIT_ACTION ;;
  }

  dimension_group: table_created {
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
    sql: ${TABLE}.CREATED ;;
  }

  dimension: is_insertable_into {
    label: "Is Insertable Into"
    type: string
    sql: ${TABLE}.IS_INSERTABLE_INTO ;;
  }

  dimension: is_transient {
    label: "Is Transient"
    type: string
    sql: ${TABLE}.IS_TRANSIENT ;;
  }

  dimension: is_typed {
    label: "Is Typed"
    type: string
    sql: ${TABLE}.IS_TYPED ;;
  }

  dimension_group: table_last_altered {
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
    sql: ${TABLE}.LAST_ALTERED ;;
  }

  dimension: reference_generation {
    label: "Reference Generation"
    type: string
    sql: ${TABLE}.REFERENCE_GENERATION ;;
  }

  dimension: retention_time {
    label: "Retention Time"
    type: number
    sql: ${TABLE}.RETENTION_TIME ;;
  }

  dimension: row_count {
    label: "Table Row Count"
    type: number
    sql: ${TABLE}.ROW_COUNT ;;
  }

  dimension: self_referencing_column_name {
    label: "Self Referencing Column Name"
    type: string
    sql: ${TABLE}.SELF_REFERENCING_COLUMN_NAME ;;
  }

  dimension: table_catalog {
    label: "Catalog"
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
  }

  dimension: table_name {
    label: "Table Name"
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: table_owner {
    label: "Table Owner"
    type: string
    sql: ${TABLE}.TABLE_OWNER ;;
  }

  dimension: table_schema {
    label: "Schema"
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
  }

  dimension: table_type {
    label: "Table Type"
    type: string
    sql: ${TABLE}.TABLE_TYPE ;;
  }

  dimension: user_defined_type_catalog {
    group_label: "UDT"
    label: "UDT Catalog"
    type: string
    sql: ${TABLE}.USER_DEFINED_TYPE_CATALOG ;;
  }

  dimension: user_defined_type_name {
    group_label: "UDT"
    label: "UDT Name"
    type: string
    sql: ${TABLE}.USER_DEFINED_TYPE_NAME ;;
  }

  dimension: user_defined_type_schema {
    group_label: "UDT"
    label: "UDT Schema"
    type: string
    sql: ${TABLE}.USER_DEFINED_TYPE_SCHEMA ;;
  }

  measure: count {
    label: "Number of Tables"
    type: count
    drill_fields: [detail*]
  }

  measure: total_rows {
    label: "Total Number of Rows"
    type: sum
    sql: ${row_count} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      catalog_schema_name,
      schema_table_name,
      table_name,
      table_schema,
      table_owner,
      table_type,
      row_count,
      megabytes,
      table_created_date,
      table_last_altered_date
    ]
  }
}
