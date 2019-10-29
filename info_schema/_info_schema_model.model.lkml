connection: "snowflake_stitch"

include: "/lookml/*.view"
include: "/looker_api/*.view"
include: "/info_schema/*.view"

datagroup: info_schema_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: info_schema_default_datagroup

explore: columns {
  group_label: "DB Info Schema"
  label: "Column Metadata"
  join: tables {
    type: left_outer
    relationship: many_to_one
    sql_on: ${columns.table_key} = ${tables.table_pk} ;;
  }
  join: table_constraints {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tables.table_pk} = ${table_constraints.table_key} ;;
  }
  join: schemata {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tables.catalog_schema_name} = ${schemata.catalog_schema_name} ;;
  }
  join: databases {
    type: left_outer
    relationship: many_to_one
    sql_on: ${schemata.catalog_name} = ${databases.database_name} ;;
  }
}

explore: tables {
  group_label: "DB Info Schema"
  label: "Table Metadata"
  join: table_constraints {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tables.table_pk} = ${table_constraints.table_key} ;;
  }
  join: schemata {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tables.catalog_schema_name} = ${schemata.catalog_schema_name} ;;
  }
  join: databases {
    type: left_outer
    relationship: many_to_one
    sql_on: ${schemata.catalog_name} = ${databases.database_name} ;;
  }
}

explore: schemata {
  group_label: "DB Info Schema"
  label: "Schema Metadata"
  join: databases {
    type: left_outer
    relationship: many_to_one
    sql_on: ${schemata.catalog_name} = ${databases.database_name} ;;
  }
}
