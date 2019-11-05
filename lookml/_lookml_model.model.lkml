connection: "snowflake_stitch"

include: "/lookml/*.view"
include: "/looker_api/*.view"
include: "/info_schema/*.view"

datagroup: lookml_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lookml_default_datagroup


explore: models__explores__joins__views {
  group_label: "LookML"
  label: "Models Explores Joins Views"
}


explore: columns {
  view_name: columns
  # extends: [queries]
  group_label: "LookML"
  label: "DB Columns Fields"
  view_label: " DB Columns"
  join: tables {
    view_label: " DB Tables"
    type: left_outer
    relationship: many_to_one
    sql_on: ${columns.table_key} = ${tables.table_pk} ;;
  }
  join: views__fields {
    view_label: "LookML Fields"
    type: left_outer
    relationship: one_to_many
    sql_on: ${columns.table_column_name} = ${views__fields.table_column_name}
          AND ${columns.table_schema} = ${views__fields.db_schema_name} ;;
  }
  join: views {
    view_label: "LookML Views"
    type: left_outer
    relationship: many_to_one
    sql_on: ${views__fields.view_key} = ${views.view_key} ;;
  }
  join: models__explores__joins__views {
    view_label: "LookML Joins"
    type: left_outer
    relationship: one_to_many
    sql_on: ${views__fields.view_key} = ${models__explores__joins__views.view_key} ;;
  }

  join: queries__fields_all {
    view_label: "Looker Queries Fields"
    type: left_outer
    relationship: one_to_many
    sql_on: ${models__explores__joins__views.view_alias_name} || '.'
            and ${views__fields.name} = ${queries__fields_all.field_name} ;;
    fields: [field_name]
  }
  join: queries {
    view_label: "Looker Queries"
    type: left_outer
    relationship: many_to_one
    sql_on: ${queries__fields_all.query_id} = ${queries.id} ;;
    fields: [model, view]
  }

#   join: explores__fields {
#     view_label: "Looker Explore Fields"
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${views__fields.view_field_name} = ${explores__fields.view_field_name} ;;
#   }
#   join: explores {
#     view_label: "Looker Explores"
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${explores__fields.explore_id} = ${explores.id} ;;
#   }

}

explore: models_explores {
  view_name: model_files
  group_label: "LookML"
  label: "Models Explores"
  join: lookml_models {
    view_label: "API: LookML Models"
    type: left_outer
    relationship: one_to_one
    sql_on: ${model_files.model_name} = ${lookml_models.name} ;;
  }
  join: project_files {
    view_label: "API: Project Files"
    type: left_outer
    relationship: one_to_one
    sql_on: ${model_files.path} = ${project_files.path} ;;
  }
  join: projects {
    view_label: "API: Projects"
    type: left_outer
    relationship: one_to_one
    sql_on: ${project_files.project_id} = ${projects.name} ;;
  }
  join: models {
    type: left_outer
    relationship: one_to_one
    sql_on: ${model_files.model_file_pk} = ${models.model_pk}  ;;
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
    sql_on: ${model_files.model_file_pk} = ${models__explores.model_key}  ;;
  }
  # Explore level joins
  join: models__explores__access_filters {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:access_filters) af ;;
    required_joins: [models__explores]
  }
  join: models__explores__always_filters {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:always_filter:filters) aff ;;
    required_joins: [models__explores]
  }
  join: models__explores__always_joins {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:always_join) aj ;;
    required_joins: [models__explores]
  }
  join: models__explores__cancel_grouping_fields {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:cancel_grouping_fields) cgf ;;
    required_joins: [models__explores]
  }
  join: models__explores__conditionally_filters {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:conditionally_filter:filters) cff ;;
    required_joins: [models__explores]
  }
  join: models__explores__conditionally_filters_unless {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:conditionally_filter:unless) cfu ;;
    required_joins: [models__explores]
  }
  join: models__explores__extends {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:extends) ext ;;
    required_joins: [models__explores]
  }
  join: models__explores__fields {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:fields) f ;;
    required_joins: [models__explores]
  }
  join: models__explores__required_access_grants {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ex.value:required_access_grants) rag ;;
    required_joins: [models__explores]
  }
  join: models__includes {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${models.includes}) inc ;;
  }
  join: models__map_layers {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${models.map_layers}) ml ;;
  }
  join: models__named_value_formats {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${models.named_value_formats}) nvf ;;
  }
}


# Extend Models Explores to add Joins
explore: models_explores_joins {
  view_name: model_files
  group_label: "LookML"
  label: "Models Explores Joins"
  extends: [models_explores, views_explore]
  join: models__explores__joins__views {
    type: left_outer
    relationship: one_to_many
    sql_on: ${models__explores.explore_id} = ${models__explores__joins__views.explore_id} ;;
  }
  # Join level joins
  join: models__explores__joins__fields {
    type: left_outer
    relationship: one_to_many
    sql_on: ${models__explores__joins__views.join_key} = ${models__explores__joins__fields.join_key};;
  }
  join: models__explores__joins__required_access_grants {
    type: left_outer
    relationship: one_to_many
    sql_on: ${models__explores__joins__views.join_key} = ${models__explores__joins__required_access_grants.join_key} ;;
  }
  # Views Explore
  join: views {
    type: left_outer
    relationship: one_to_one
    sql_on: ${models__explores__joins__views.view_key} = ${views.view_key} ;;
  }
  join: view_files {
    type: left_outer
    relationship: many_to_one
    sql_on: ${views.view_file_key} = ${view_files.view_file_pk} ;;
  }
}



# Views ONLY, without Models Explores
explore: views_explore {
  view_name: view_files
  group_label: "LookML"
  label: "Views"
  join: views {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_files.view_file_pk} = ${views.view_file_key} ;;
  }
  # ALL Fields (includes Dimensions, Dimension Groups (exploded), Measures, Filters, and Parameters
  join: views__fields {
    type: left_outer
    relationship: one_to_many
    sql_on: ${views.view_key} = ${views__fields.view_key} ;;
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
      sql: , lateral flatten(input => ${views.derived_table}:explore_source:derived_columns) esdc ;;
      required_joins: [views]
    }
    join: views__derived_table__explore_source__filters {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => v.derived_table:explore_source:filters) esf ;;
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
      sql: , lateral flatten(input => ${views.dimension_groups}) dg ;;
      required_joins: [views]
    }
      join: views__dimension_groups__alias {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => dg.value:alias) dgals ;;
        required_joins: [views, views__dimension_groups]
      }
      join: views__dimension_groups__drill_fields {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => dg.value:drill_fields) dgdf ;;
        required_joins: [views, views__dimension_groups]
      }
      join: views__dimension_groups__intervals {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => dg.value:intervals) dgint ;;
        required_joins: [views, views__dimension_groups]
      }
      join: views__dimension_groups__required_access_grants {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => dg.value:required_access_grants) dgrag ;;
        required_joins: [views, views__dimension_groups]
      }
      join: views__dimension_groups__tags {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => dg.value:tags) dgtag ;;
        required_joins: [views, views__dimension_groups]
      }
      join: views__dimension_groups__timeframes {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => dg.value:timeframes) dgtf ;;
        required_joins: [views, views__dimension_groups]
      }

    # Dimensions level joins
    join: views__dimensions {
      type: left_outer
      relationship: one_to_many
      sql: , lateral flatten(input => ${views.dimensions}) d ;;
      required_joins: [views]
    }
      # Actions level joins
      join: views__dimensions__actions {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => d.value:actions) dact ;;
        required_joins: [views, views__dimensions]
      }
        join: views__dimensions__actions__form_params {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => dact.value:form_params) dactfp ;;
          required_joins: [views, views__dimensions, views__dimensions__actions]
        }
          join: views__dimensions__actions__form_params__options {
            type: left_outer
            relationship: one_to_many
            sql: , lateral flatten(input => dactfp.value:options) dactfpo ;;
            required_joins: [views, views__dimensions, views__dimensions__actions, views__dimensions__actions__form_params]
          }
          join: views__dimensions__actions__params {
            type: left_outer
            relationship: one_to_many
            sql: , lateral flatten(input => dact.value:params) dactp ;;
            required_joins: [views, views__dimensions, views__dimensions__actions]
          }
          join: views__dimensions__actions__user_attribute_params {
            type: left_outer
            relationship: one_to_many
            sql: , lateral flatten(input => dact.value:user_attribute_params) dactuap ;;
            required_joins: [views, views__dimensions, views__dimensions__actions]
          }
        join: views__dimensions__alias {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:alias) dals ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__case__whens {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:"case":whens) dcw ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__drill_fields {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:drill_fields) ddf ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__links {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:intervals) dlnk ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__required_access_grants {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:required_access_grants) drag ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__required_fields {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:required_fields) drf ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__suggestions {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:suggestions) dsug ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__tags {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:tags) dtag ;;
          required_joins: [views, views__dimensions]
        }
        join: views__dimensions__tiers {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => d.value:timeframes) dtier ;;
          required_joins: [views, views__dimensions]
        }

      join: views__extends {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ${views.extends}) ext ;;
        required_joins: [views]
      }

      # Filter level joins
      join: views__filters {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ${views.filters}) f ;;
        required_joins: [views]
      }
        join: views__filters__alias {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => f.value:alias) fals ;;
          required_joins: [views, views__filters]
        }
        join: views__filters__required_access_grants {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => f.value:required_access_grants) frag ;;
          required_joins: [views, views__filters]
        }
        join: views__filters__required_fields {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => f.value:required_fields) frf ;;
          required_joins: [views, views__filters]
        }
        join: views__filters__suggestions {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => f.value:suggestions) fsug ;;
          required_joins: [views, views__filters]
        }
        join: views__filters__tags {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => f.value:tags) ftag ;;
          required_joins: [views, views__filters]
        }


      # Measure level joins
      join: views__measures {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ${views.measures}) m ;;
        required_joins: [views]
      }
        # Actions level joins
        join: views__measures__actions {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:actions) mact ;;
          required_joins: [views, views__measures]
        }
          join: views__measures__actions__form_params {
            type: left_outer
            relationship: one_to_many
            sql: , lateral flatten(input => dact.value:form_params) mactfp ;;
            required_joins: [views, views__measures, views__measures__actions]
          }
            join: views__measures__actions__form_params__options {
              type: left_outer
              relationship: one_to_many
              sql: , lateral flatten(input => dactfp.value:options) mactfpo ;;
              required_joins: [views, views__measures, views__measures__actions, views__measures__actions__form_params]
            }
          join: views__measures__actions__params {
            type: left_outer
            relationship: one_to_many
            sql: , lateral flatten(input => dact.value:params) mactp ;;
            required_joins: [views, views__measures, views__measures__actions]
          }
          join: views__measures__actions__user_attribute_params {
            type: left_outer
            relationship: one_to_many
            sql: , lateral flatten(input => dact.value:user_attribute_params) mactuap ;;
            required_joins: [views, views__measures, views__measures__actions]
          }
        join: views__measures__alias {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:alias) mals ;;
          required_joins: [views, views__measures]
        }
        join: views__measures__drill_fields {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:drill_fields) mdf ;;
          required_joins: [views, views__measures]
        }
        join: views__measures__filters {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:drill_fields) mf ;;
          required_joins: [views, views__measures]
        }
        join: views__measures__links {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:intervals) mlnk ;;
          required_joins: [views, views__measures]
        }
        join: views__measures__required_access_grants {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:required_access_grants) mrag ;;
          required_joins: [views, views__measures]
        }
        join: views__measures__required_fields {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:required_fields) mrf ;;
          required_joins: [views, views__measures]
        }
        join: views__measures__tags {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => m.value:tags) mtag ;;
          required_joins: [views, views__measures]
        }

      # Parameter level joins
      join: views__parameters {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ${views.parameters}) p ;;
        required_joins: [views]
      }
        join: views__parameters__alias {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => p.value:alias) pals ;;
          required_joins: [views, views__parameters]
        }
        join: views__parameters__allowed_values {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => p.value:allowed_values) pav ;;
          required_joins: [views, views__parameters]
        }
        join: views__parameters__required_access_grants {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => p.value:required_access_grants) prag ;;
          required_joins: [views, views__parameters]
        }
        join: views__parameters__required_fields {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => p.value:required_fields) prf ;;
          required_joins: [views, views__parameters]
        }
        join: views__parameters__suggestions {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => p.value:suggestions) psug ;;
          required_joins: [views, views__parameters]
        }
        join: views__parameters__tags {
          type: left_outer
          relationship: one_to_many
          sql: , lateral flatten(input => p.value:tags) ptag ;;
          required_joins: [views, views__parameters]
        }

      join: views__required_access_grants {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ${views.required_access_grants}) vrag ;;
        required_joins: [views]
      }
      join: views__sets {
        type: left_outer
        relationship: one_to_many
        sql: , lateral flatten(input => ${views.sets}) "set"
             , lateral flatten(input => "set".value:fields) sfld ;;
        required_joins: [views]
      }
}

explore: views_fields {
  view_name: views__fields
  group_label: "LookML"
  label: "View Fields"
  view_label: "LookML Fields"

  join: columns {
    view_label: "DB Columns"
    type: left_outer
    relationship: one_to_many
    sql_on: ${columns.table_column_name} = ${views__fields.table_column_name}
      AND ${columns.table_schema} = ${views__fields.db_schema_name} ;;
  }

  join: x_view_fields_db_columns {
    sql: ;;
    # Use `sql` instead of `sql_on` and put some whitespace in it
    relationship: one_to_one
    view_label: "LookML Fields" #For cleaner explore UI
}

}
