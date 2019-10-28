connection: "snowflake_stitch"

include: "/lookml/*.view"
include: "/looker_api/*.view"
include: "/info_schema/*.view"


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


# Explore to show organization of Content
explore: content_metadata {
  group_label: "Looker API"
  label: "Content"
  # content_views: view_count, favorite_count, per user and by last view date
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


explore: dashboards {
  view_name: dashboards
  extends: [queries]
  group_label: "Looker API"
  label: "Dashboards"
  join: content_metadata {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dashboards.content_metadata_id} = ${content_metadata.id} ;;
  }
  join: content_views {
    type: left_outer
    relationship: one_to_many
    sql_on: ${content_metadata.id} = ${content_views.content_metadata_id} ;;
  }
  join: viewing_users {
    view_label: "Viewing Users"
    from: users
    type: left_outer
    relationship: many_to_one
    sql_on: ${content_views.user_id} = ${viewing_users.id} ;;
  }
  join: folders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dashboards.folder_id} = ${folders.id} ;;
  }
  join: dashboard_filters {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dashboards.id} = ${dashboard_filters.dashboard_id} ;;
  }
  join: dashboard_layouts {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dashboards.id} = ${dashboard_layouts.dashboard_id} ;;
  }
  join: dashboard_layouts_components {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${dashboard_layouts.dashboard_layout_components}) dlc  ;;
  }
  join: dashboard_elements {
    type: left_outer
    relationship: one_to_many
    sql_on: ${dashboards.id} = ${dashboard_elements.dashboard_id} ;;
  }
  join: looks {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dashboard_elements.look_id} = ${looks.id} ;;
  }
  join: queries {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dashboard_elements.query_id} = ${queries.id} ;;
  }
  join: create_user {
    view_label: "Create User"
    from: users
    type: left_outer
    relationship: many_to_one
    sql_on: ${dashboards.user_id} = ${create_user.id} ;;
  }
}


# Explores down to fields - with related lookml_model, project, file, connection info
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
    sql_on:  ${explores.id} = ${explores.scopes} ;;
  }
  join: explores__sets {
    type: left_outer
    relationship: one_to_many
    sql_on: ${explores.id} = ${explores__sets.explore_id} ;;
  }
  join: explores__fields {
    type: left_outer
    relationship: one_to_many
    sql_on: ${explores.id} = ${explores__fields.explore_id} ;;
  }
  join: lookml_models {
    type: left_outer
    relationship: many_to_one
    sql_on: ${explores.model_name} = ${lookml_models.name} ;;
  }
  join: project_files {
    type: left_outer
    relationship: many_to_one
    sql_on: ${explores__fields.source_file_path} = ${project_files.source_file_path} ;;
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
}

explore: folders {
  group_label: "Looker API"
  label: "Folders"
  view_label: " Folders"
#  Content access needs to be changed to respect folder inheritance
#   access_filter: {
#     field: folder_access_user_group.user_id
#     user_attribute: id
#   }
#   join: folder_access {
#     view_label: "Folder Access"
#     from: content_metadata_access
#     type: inner
#     relationship: one_to_many
#     sql_on: ${folders.content_metadata_id} = ${folder_access.content_metadata_id} ;;
#   }
#   join: folder_access_user_group {
#     view_label: "Folder Access User Group"
#     from: users__groups
#     type: inner
#     relationship: one_to_many
#     sql_on: ${folder_access.group_id} = ${folder_access_user_group.group_id} ;;
#   }
  join: sub_folders {
    view_label: "Sub Folders"
    from: folders
    type: left_outer
    relationship: one_to_many
    sql_on: ${folders.id} = ${sub_folders.parent_id} ;;
  }
  join: parent_folder {
    view_label: "Parent Folder"
    from: folders
    type: left_outer
    relationship: many_to_one
    sql_on: ${folders.parent_id} = ${parent_folder.id} ;;
  }
  join: folder_contents {
    view_label: "Folder Contents"
    from: content_metadata
    type: left_outer
    relationship: one_to_many
    sql_on: ${folders.content_metadata_id} = ${folder_contents.parent_id} ;;
  }
  join: folder_content_views {
    view_label: "Folder Content Views"
    from: content_views
    type: left_outer
    relationship: one_to_many
    sql_on: ${folder_contents.id} = ${folder_content_views.content_metadata_id} ;;
  }
  join: viewing_users {
    view_label: "Viewing Users"
    from: users
    type: left_outer
    relationship: many_to_one
    sql_on: ${folder_content_views.user_id} = ${viewing_users.id} ;;
  }
  join: viewing_user_groups {
    view_label: "Viewing User Groups"
    from: users__groups
    type: left_outer
    relationship: one_to_many
    sql_on: ${viewing_users.id} = ${viewing_user_groups.user_id} ;;
    fields: []
  }
  join: viewing_groups {
    view_label: "Viewing Groups"
    from: groups
    type: left_outer
    relationship: many_to_one
    sql_on: ${viewing_user_groups.group_id} = ${viewing_groups.id} ;;
  }
  join: viewing_user_roles {
    view_label: "Viewing User Roles"
    from: users__roles
    type: left_outer
    relationship: one_to_many
    sql_on: ${viewing_users.id} = ${viewing_user_roles.user_id} ;;
    fields: []
  }
  join: viewing_roles {
    view_label: "Viewing Roles"
    from: roles
    type: left_outer
    relationship: many_to_one
    sql_on: ${viewing_user_roles.role_id} = ${viewing_roles.id} ;;
  }
  join: folder_dashboards {
    view_label: "Folder Dashboards"
    from: dashboards
    type: left_outer
    relationship: one_to_one
    sql_on: ${folder_contents.dashboard_id} = ${folder_dashboards.id} ;;
  }
  join: folder_looks {
    view_label: "Folder Looks"
    from: looks
    type: left_outer
    relationship: one_to_one
    sql_on: ${folder_contents.look_id} = ${folder_looks.id} ;;
  }
}


explore: groups {
  view_name: groups
  extends: [roles]
  group_label: "Looker API"
  label: "Groups"
  join: users__groups {
    type: left_outer
    relationship: one_to_many
    sql_on: ${groups.id} = ${users__groups.group_id} ;;
    fields: []
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${users__groups.user_id} = ${users.id} ;;
  }
  join: role_groups {
    type: left_outer
    relationship: one_to_many
    sql_on: ${groups.id} = ${role_groups.id} ;;
    fields: []
  }
  join: roles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${role_groups.role_id} = ${roles.id} ;;
  }
}


explore: lookml_models {
  group_label: "Looker API"
  label: "LookML Models"
  join: lookml_models__connections {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lookml_models.name} = ${lookml_models__connections.model_name} ;;
    fields: []
  }
  join: connections {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lookml_models__connections.connection} = ${connections.name} ;;
  }
  join: lookml_models__explores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lookml_models.name} = ${lookml_models__explores.model_name} ;;
  }
  join: project_files {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lookml_models.project_file_key} = ${project_files.project_file_key} ;;
  }
  join: projects {
    type: left_outer
    relationship: many_to_one
    sql_on: ${project_files.project_id} = ${projects.name} ;;
  }
}



explore: looks {
  view_name: looks
  extends: [queries]
  group_label: "Looker API"
  label: "Looks"
  join: content_metadata {
    type: left_outer
    relationship: many_to_one
    sql_on: ${looks.content_metadata_id} = ${content_metadata.id} ;;
  }
  join: content_views {
    type: left_outer
    relationship: one_to_many
    sql_on: ${content_metadata.id} = ${content_views.content_metadata_id} ;;
  }
  join: viewing_users {
    view_label: "Viewing Users"
    from: users
    type: left_outer
    relationship: many_to_one
    sql_on: ${content_views.user_id} = ${viewing_users.id} ;;
  }
  join: folders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${looks.folder_id} = ${folders.id} ;;
  }
  join: dashboard_elements {
    type: left_outer
    relationship: one_to_many
    sql_on: ${looks.id} = ${dashboard_elements.look_id} ;;
  }
  join: dashboards {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dashboard_elements.dashboard_id} = ${dashboards.id} ;;
  }
  join: queries {
    type: left_outer
    relationship: many_to_one
    sql_on: ${looks.query_id} = ${queries.id} ;;
  }
  join: create_user {
    view_label: "Create User"
    from: users
    type: left_outer
    relationship: many_to_one
    sql_on: ${looks.user_id} = ${create_user.id} ;;
  }
}


explore: projects {
  view_name: projects
  group_label: "Looker API"
  label: "Projects"
  join: git_branches {
    type: left_outer
    relationship: one_to_many
    sql_on: ${projects.name} = ${git_branches.project_id} ;;
  }
  join: project_files {
    type: left_outer
    relationship: one_to_many
    sql_on: ${projects.name} = ${project_files.project_id} ;;
  }
  join: lookml_models {
    type: left_outer
    relationship: many_to_one
    sql_on: ${project_files.project_file_key} = ${lookml_models.project_file_key} ;;
  }
  join: lookml_models__connections {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lookml_models.name} = ${lookml_models__connections.model_name} ;;
    fields: []
  }
  join: lookml_models__explores {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lookml_models.name} = ${lookml_models__explores.model_name} ;;
  }
  join: connections {
    type: left_outer
    relationship: many_to_one
    sql_on: ${lookml_models__connections.connection} = ${connections.name} ;;
  }
}


# Queries Explore
explore: queries {
  view_name: queries
  group_label: "Looker API"
  label: "Queries v2"
  join: queries__dynamic_fields {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => parse_json(${queries.dynamic_fields})) qdf ;;
  }
  join: queries__filters {
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries.id} = ${queries__filters.query_id} ;;
  }
  join: queries__fields_all {
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries.id} = ${queries__fields_all.query_id} ;;
  }
  join: queries__filter_fields {
    from: queries__filters
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries__fields_all.query_id} = ${queries__filter_fields.query_id}
      and ${queries__fields_all.field_name} = ${queries__filter_fields.filter_field} ;;
  }
  join: queries__fields_select {
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries__fields_all.fields_pk} = ${queries__fields_select.fields_pk} ;;
  }
  join: queries__fill_fields {
    type: left_outer
    relationship: one_to_one
    sql_on: ${queries__fields_all.fields_pk} = ${queries__fill_fields.fills_pk} ;;
  }
  join: queries__pivots {
    type: left_outer
    relationship: one_to_one
    sql_on: ${queries__fields_all.fields_pk} = ${queries__pivots.pivots_pk} ;;
  }
  join: queries__sorts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${queries__fields_all.fields_pk} = ${queries__sorts.sorts_pk} ;;
  }
}


# Queries Explore
explore: queries_content {
  view_name: queries
  extends: [queries]
  group_label: "Looker API"
  label: "Queries Content"
  join: looks {
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries.id} = ${looks.query_id} ;;
  }
  join: dashboard_elements {
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries.id} = ${dashboard_elements.query_id} ;;
  }
  join: dashboards {
    type: left_outer
    relationship: many_to_one
    sql_on: ${dashboard_elements.dashboard_id} = ${dashboards.id} ;;
  }
  join: merge_queries__source_queries {
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries.id} = ${merge_queries__source_queries.query_id} ;;
  }
  join: merge_queries {
    type: left_outer
    relationship: many_to_one
    sql_on: ${merge_queries__source_queries.merge_query_id} = ${merge_queries.id} ;;
  }
  join: merge_dashboard_elements {
    from: dashboard_elements
    view_label: "Merge Dashboard Elements"
    type: left_outer
    relationship: one_to_many
    sql_on: ${queries.id} = ${merge_dashboard_elements.query_id} ;;
  }
  join: merge_dashboards {
    from: dashboards
    view_label: "Merge Dashboards"
    type: left_outer
    relationship: many_to_one
    sql_on: ${merge_dashboard_elements.dashboard_id} = ${merge_dashboards.id} ;;
  }
}



# Roles and related Sets, Groups, etc.
explore: roles {
  view_name: roles
  group_label: "Looker API"
  label: "Roles"
  fields: [
    ALL_FIELDS*,
    -permissions.permission
    ]
  join: model_sets {
    type: left_outer
    relationship: many_to_one
    sql_on: ${roles.model_set_id} = ${model_sets.id} ;;
  }
  join: model_sets__models {
    type: left_outer
    relationship: one_to_many
    sql_on: ${model_sets.id} = ${model_sets__models.model_set_id} ;;
  }
  join: lookml_models {
    type: left_outer
    relationship: many_to_one
    sql_on: ${model_sets__models.model} = ${lookml_models.name} ;;
  }
  join: permission_sets {
    type: left_outer
    relationship: many_to_one
    sql_on: ${roles.permission_set_id} = ${permission_sets.id} ;;
  }
  join: permission_sets__permissions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${permission_sets.id} = ${permission_sets__permissions.permission_set_id} ;;
  }
  join: permissions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${permission_sets__permissions.permission} = ${permissions.permission} ;;
  }
}


explore: role_groups {
  view_name: roles
  extends: [roles]
  join: role_groups {
    type: left_outer
    relationship: one_to_many
    sql_on: ${roles.id} = ${role_groups.role_id} ;;
  }
  join: groups {
    type: left_outer
    relationship: many_to_one
    sql_on: ${role_groups.id} = ${groups.id} ;;
  }
}


explore: users {
  view_name: users
  extends: [roles]
  group_label: "Looker API"
  label: "Users"
  join: users__groups {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${users__groups.user_id} ;;
    fields: []
  }
  join: groups {
    type: left_outer
    relationship: many_to_one
    sql_on: ${users__groups.group_id} = ${groups.id} ;;
  }
  join: users__roles {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${users__roles.user_id} ;;
    fields: []
  }
  join: roles {
    type: left_outer
    relationship: many_to_one
    sql_on: ${users__roles.role_id} = ${roles.id} ;;
  }
  join: user_attribute_values {
    type: left_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${user_attribute_values.user_id} ;;
  }
  join: user_attributes {
    type: left_outer
    relationship: many_to_one
    sql_on: ${user_attribute_values.user_attribute_id} = ${user_attributes.id} ;;
  }
}
