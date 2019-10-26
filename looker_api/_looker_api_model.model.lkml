connection: "snowflake_stitch"

include: "*.view.lkml"                       # include all views in this project

explore: content_usage {
  group_label: "Looker API"
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



explore: content_metadata {
  group_label: "Looker API"
  label: "Content"
  join: content_views {
    type: left_outer
    relationship: one_to_many
    sql_on: ${content_metadata.id} = ${content_views.content_metadata_id} ;;
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${content_views.user_id} = ${users.id} ;;
  }
  join: dashboards {
    type: left_outer
    relationship: many_to_one
    sql_on: ${content_metadata.dashboard_id} = ${dashboards.id} ;;
  }
  join: looks {
    type: left_outer
    relationship: many_to_one
    sql_on: ${content_metadata.dashboard_id} = ${dashboards.id} ;;
  }
  join: folders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${content_metadata.folder_id} = ${folders.id} ;;
  }
  join: spaces {
    type: left_outer
    relationship: many_to_one
    sql_on: ${content_metadata.space_id} = ${spaces.id} ;;
  }
}



explore: explores {
  group_label: "Looker API"
  label: "Explores"
  join: explores__access_filters {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${explores.access_filters}) af ;;
  }
  join: explores__aliases {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${explores.aliases}) als ;;
  }
  join: explores__always_filters {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${explores.always_filters}) aff ;;
  }
  join: explores__conditionally_filters {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${explores.conditionally_filter}) cff ;;
  }
  join: explores__scopes {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${explores.scopes}) scp ;;
  }
  join: explores__sets {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${explores.sets}) "set"
         , lateral flatten(input => "set".value:value) setfld ;;
  }
  join: explores__fields {
    type: left_outer
    relationship: one_to_many
    sql: ${explores.id} = ${explores__fields.explore_id} ;;
  }
  join: lookml_models {
    type: left_outer
    relationship: many_to_one
    sql_on: ${explores.model_name} = ${lookml_models.name} ;;
  }
  join: connections {
    type: left_outer
    relationship: many_to_one
    sql_on: ${explores.connection_name} = ${connections.name} ;;
  }
  join: projects {
    type: left_outer
    relationship: many_to_one
    sql_on: ${explores.project_name} = ${projects.name} ;;
  }
  join: project_files {
    type: left_outer
    relationship: many_to_one
    sql_on: ${explores.source_file} = ${project_files.title}
      and ${explores.project_name} = ${project_files.project_id} ;;
  }
}
