connection: "snowflake_stitch"

include: "/views_mambu/*.view"

datagroup: mambu_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mambu_default_datagroup


# EXPLORES
# MAMBU

explore: branches {
  join: branch_addresses {
    sql: , lateral flatten(input => ${branches.addresses}) ba ;;
    type: left_outer
    relationship: one_to_many
  }
  join: branch_holidays {
    sql: , lateral flatten(input => ${branches.branch_holidays}) bh ;;
    type: left_outer
    relationship: one_to_many
  }
  join: branch_custom_field_sets {
    sql: , lateral flatten(input => ${branches.custom_field_sets}) bcfs ;;
    type: left_outer
    relationship: one_to_many
  }
  join: branch_custom_field_values {
    sql: , lateral flatten(input => ${branch_custom_field_sets.branch_custom_field_values_json}) bcfv ;;
    type: full_outer
    relationship: one_to_many
  }
}

explore: centres {
  join: centre_addresses {
    sql: , lateral flatten(input => ${centres.addresses}) ca ;;
    type: left_outer
    relationship: one_to_many
  }
  join: centre_custom_field_sets {
    sql: , lateral flatten(input => ${centres.custom_field_sets}) ccfs ;;
    type: left_outer
    relationship: one_to_many
  }
  join: centre_custom_field_values {
    sql: , lateral flatten(input => ${centre_custom_field_sets.centre_custom_field_values_json}) ccfv ;;
    type: full_outer
    relationship: one_to_many
  }
}

explore: clients {
  join: client_addresses {
    sql: , lateral flatten(input => ${clients.addresses}) cla ;;
    type: left_outer
    relationship: one_to_many
  }
  join: client_custom_field_sets {
    sql: , lateral flatten(input => ${clients.custom_field_sets}) clcfs ;;
    type: left_outer
    relationship: one_to_many
  }
  join: client_custom_field_values {
    sql: , lateral flatten(input => ${client_custom_field_sets.client_custom_field_values_json}) clcfv ;;
    type: full_outer
    relationship: one_to_many
  }
}
