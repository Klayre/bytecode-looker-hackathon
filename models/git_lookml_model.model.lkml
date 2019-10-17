connection: "snowflake_stitch"

include: "/views_git_lookml/*.view"

datagroup: lookml_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lookml_default_datagroup


explore: model_files {
  group_label: "Git LookML"
  label: "Models"
  view_label: " Model Files"
  join: models {
    view_label: " Models"
    type: left_outer
    relationship: one_to_one
    sql_on: ${model_files.model_file_pk} = ${models.model_pk} ;;
  }
    # Model level joins
    join: models__access_grants {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${models.access_grants}) ag
           , lateral flatten(input => ag.value:allowed_values) agv ;;
      required_joins: [models]
    }
    join: models__datagroups {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${models.datagroups}) dg ;;
      required_joins: [models]
    }
    join: models__explores {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${models.explores}) ex ;;
      required_joins: [models]
    }
      # Explore level joins
      join: models__explores__access_filters {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:access_filters) af ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__always_filters {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:always_filter:filters) aff ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__always_joins {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:always_join) aj ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__cancel_grouping_fields {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:cancel_grouping_fields) cgf ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__conditionally_filters {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:conditionally_filter:filters) cff ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__conditionally_filters_unless {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:conditionally_filter:unless) cfu ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__extends {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:extends) ext ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__fields {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:fields) f ;;
        required_joins: [models, models__explores]
      }
      join: models__explores__joins {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:joins) j ;;
        required_joins: [models, models__explores]
      }
        # Join level joins
        join: models__explores__joins__fields {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => j.value:fields) jf ;;
          required_joins: [models, models__explores, models__explores__joins]
        }
        join: models__explores__joins__required_access_grants {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => j.value:required_access_grants) jrag ;;
          required_joins: [models, models__explores, models__explores__joins]
        }
        join: models__explores__joins__required_joins {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => j.value:required_access_grants) jrj ;;
          required_joins: [models, models__explores, models__explores__joins]
        }
      join: models__explores__required_access_grants {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ex.value:required_access_grants) rag ;;
        required_joins: [models, models__explores]
      }
    join: models__named_value_formats {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${models.named_value_formats}) nvf ;;
      required_joins: [models]
    }
}

explore: view_files {
  group_label: "Git LookML"
  label: " Views"
  view_label: " View Files"
  join: views {
    view_label: " Views"
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_files.view_file_pk} = ${views.view_file_key} ;;
  }
    # Derived Table joins
    join: views__derived_table__cluster_keys {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.derived_table}:cluster_keys) ck ;;
      required_joins: [views]
    }
    join: views__derived_table__create_process__sql_steps {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.derived_table}:create_process:sql_steps) ss ;;
      required_joins: [views]
    }
    join: views__derived_table__explore_source__columns {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.derived_table}:explore_source:columns) esc ;;
      required_joins: [views]
    }
    join: views__derived_table__explore_source__derived_columns {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.derived_table}:explore_source:derived_columns) esdc;;
      required_joins: [views]
    }
    join: views__derived_table__indexes {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.derived_table}:indexes) idx ;;
      required_joins: [views]
    }
    join: views__derived_table__partition_keys {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.derived_table}:partition_keys) pk ;;
      required_joins: [views]
    }
    join: views__derived_table__sortkeys {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.derived_table}:sortkeys) sk ;;
      required_joins: [views]
    }
    # Dimension Groups level joins
    join: views__dimension_groups {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => v.dimension_groups) dg ;;
      required_joins: [views]
    }


}
