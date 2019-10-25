view: schemata {
  label: "Schemas"
  sql_table_name: SNOWFLAKE_SAMPLE_DATA.INFORMATION_SCHEMA.SCHEMATA ;;

  dimension: catalog_schema_name {
    label: "Catalog.Schema Name"
    type: string
    primary_key: yes
    sql: ${catalog_name} || '.' || ${schema_name} ;;
  }

  dimension: catalog_name {
    label: "Catalog Name"
    type: string
    sql: ${TABLE}.CATALOG_NAME ;;
  }

  dimension: comment {
    label: "Schema Comment"
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension_group: schema_created {
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

  dimension: default_character_set_catalog {
    group_label: "Default Char Set"
    label: "Default Char Set Catalog"
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_CATALOG ;;
  }

  dimension: default_character_set_name {
    group_label: "Default Char Set"
    label: "Default Char Set Name"
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_NAME ;;
  }

  dimension: default_character_set_schema {
    group_label: "Default Char Set"
    label: "Default Char Set Catalog"
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_SCHEMA ;;
  }

  dimension: is_managed_access {
    label: "Is Managed Access"
    type: string
    sql: ${TABLE}.IS_MANAGED_ACCESS ;;
  }

  dimension: is_transient {
    label: "Is Transient"
    type: string
    sql: ${TABLE}.IS_TRANSIENT ;;
  }

  dimension_group: schema_last_altered {
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

  dimension: retention_time {
    label: "Retention Time"
    type: number
    sql: ${TABLE}.RETENTION_TIME ;;
  }

  dimension: schema_name {
    label: "Schema Name"
    type: string
    sql: ${TABLE}.SCHEMA_NAME ;;
  }

  dimension: schema_owner {
    label: "Schema Owner"
    type: string
    sql: ${TABLE}.SCHEMA_OWNER ;;
  }

  dimension: sql_path {
    label: "SQL Path"
    type: string
    sql: ${TABLE}.SQL_PATH ;;
  }

  measure: count {
    label: "Number of Schemas"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      schema_name,
      schema_owner,
      catalog_name,
      catalog_schema_name,
      sql_path,
      schema_created_date,
      schema_last_altered_date
    ]
  }
}
