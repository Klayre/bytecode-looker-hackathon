connection: "snowflake_stitch"

include: "*.view.lkml"                       # include all views in this project

explore: content_usage {
  view_label: "Queries"
  from: queries
  fields: [ALL_FIELDS*,-content_usage.field]
  join: fields {
    view_label: "Queries"
    from: queries
    relationship: one_to_many
    sql: , TABLE(FLATTEN(input => parse_json(${content_usage.fields}))) as fld ;;
    fields: [fields.field]
  }
  join: dashboard_elements {
    relationship: many_to_one
    sql: , ${dashboard_elements.SQL_TABLE_NAME} as dashboard_elements ;;
    sql_where: ${content_usage.id} = ${dashboard_elements.query_id} ;;
  }
  join: looks {
    relationship: many_to_one
    sql: , ${looks.SQL_TABLE_NAME} as looks ;;
    sql_where: ${content_usage.id} = ${looks.query_id} ;;
  }
}
