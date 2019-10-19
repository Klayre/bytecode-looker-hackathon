
view: databases {
  view_label: "Databases"
  sql_table_name: INFORMATION_SCHEMA.DATABASES ;;

  dimension: database_name {
    label: "Database Name"
    type: string
    primary_key: yes
    sql: ${TABLE}.DATABASE_NAME ;;
  }

  dimension: comment {
    label: "Database Comment"
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension_group: database_created {
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

  dimension: database_owner {
    label: "Database Owner"
    type: string
    sql: ${TABLE}.DATABASE_OWNER ;;
  }

  dimension: is_transient {
    label: "Is Transient"
    type: string
    sql: ${TABLE}.IS_TRANSIENT ;;
  }

  dimension_group: database_last_altered {
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

  measure: count {
    label: "Number of Databases"
    type: count
    drill_fields: [database_name]
  }
}
