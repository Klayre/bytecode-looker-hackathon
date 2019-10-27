connection: "snowflake_stitch"

include: "/lookml/*.view"
include: "/info_schema/*.view"

datagroup: lookml_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lookml_default_datagroup


explore: models_explores {
  view_name: model_files
  group_label: "LookML"
  label: "Models Explores"
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
    sql: ${model_files.model_file_pk} = ${models__explores.model_key}  ;;
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
  extends: [models_explores]
  join: models__explores__joins {
    type: left_outer
    relationship: one_to_many
    sql_on: ${models__explores.explore_id} = ${models__explores__joins.explore_id} ;;
  }
  # Join level joins
  join: models__explores__joins__fields {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${models__explores__joins.fields}) jf ;;
  }
  join: models__explores__joins__required_access_grants {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${models__explores__joins.required_access_grants}) jrag ;;
  }
  join: models__explores__joins__required_joins {
    type: left_outer
    relationship: one_to_many
    sql: , lateral flatten(input => ${models__explores__joins.required_joins}) jrj ;;
  }
}



explore: models_explores_joins_views {
  group_label: "LookML"
  label: "Models Explores Joins Views"
  hidden: yes
  extends: [models_explores]
  join: models__explores__joins__views {
    type: left_outer
    relationship: many_to_one
    required_joins: [models, models__explores]
    sql_on: ${models__explores.explores_pk} = ${models__explores__joins__views.explore_key} ;;
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
