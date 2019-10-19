view: table_constraints {
  view_label: "Table Constraints"
  sql_table_name: INFORMATION_SCHEMA.TABLE_CONSTRAINTS ;;

  dimension: constraint_pk {
    label: "Constraint PK"
    type: string
    primary_key: yes
    sql: ${constraint_catalog} || '.' || ${constraint_schema} || '.' || ${table_name} || '.' || ${constraint_name} ;;
    hidden: yes
  }

  dimension: table_key {
    label: "Table Key"
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

  dimension: comment {
    label: "Constraint Comment"
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: constraint_catalog {
    label: "Constraint Catalog"
    type: string
    sql: ${TABLE}.CONSTRAINT_CATALOG ;;
  }

  dimension: constraint_name {
    label: "Constraint Name"
    type: string
    sql: ${TABLE}.CONSTRAINT_NAME ;;
  }

  dimension: constraint_schema {
    label: "Constraint Schema"
    type: string
    sql: ${TABLE}.CONSTRAINT_SCHEMA ;;
  }

  dimension: constraint_type {
    label: "Constraint Type"
    type: string
    sql: ${TABLE}.CONSTRAINT_TYPE ;;
  }

  dimension_group: constraint_created {
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

  dimension: enforced {
    label: "Enforced"
    type: string
    sql: ${TABLE}.ENFORCED ;;
  }

  dimension: initially_deferred {
    label: "Initiall Deferred"
    type: string
    sql: ${TABLE}.INITIALLY_DEFERRED ;;
  }

  dimension: is_deferrable {
    label: "Is Deferrable"
    type: string
    sql: ${TABLE}.IS_DEFERRABLE ;;
  }

  dimension_group: constraint_last_altered {
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

  dimension: table_catalog {
    group_label: "Table"
    label: "Table Catalog"
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
  }

  dimension: table_name {
    group_label: "Table"
    label: "Table Name"
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: table_schema {
    group_label: "Table"
    label: "Table Schema"
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
  }

  measure: count {
    label: "Number of Constraints"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      catalog_schema_name,
      schema_table_name,
      table_name,
      constraint_name,
      constraint_type,
      constraint_created_date,
      constraint_last_altered_date
    ]
  }
}
