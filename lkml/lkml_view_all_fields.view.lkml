# This View contains at least 2 of ALL sub-objects with ALL parameter fields populated
# Used for building/testing the Stitch/Singer data integration Schema JSONs

view: lkml_view_all_fields {
  sql_table_name: table_name ;;
  suggestions: no
  extends: [view_name, view_name]
  extension: required
  required_access_grants: [access_grant_name, access_grant_name_2]
  view_label: "All Fields"

  derived_table: {
    explore_source: explore_name {
      bind_filters: {
        from_field: field_name
        to_field: field_name
      }
      column: column_name {
        field: field_name
      }
      column: column_name {
        field: field_name
      }
      derived_column: column_name {
        sql: SQL query ;;
      }
      derived_column: column_name {
        sql: SQL query ;;
      }
      expression_custom_filter: custom_filter_expression ;;
      filters: {
        field: field_name
        value: "filter_value"
      }
      filters: {
        field: field_name
        value: "filter_value"
      }
      limit: 500
      sort: {
        desc: no
        field: field_name
      }
      timezone: "UTC"
    }
    sql: SQL query ;;
    persist_for: "N hours"
    sql_trigger_value: SQL query ;;
    cluster_keys: ["column_name", "column_name"]
    datagroup_trigger: datagroup_name
    distribution: "column_name"
    distribution_style: all
    sortkeys: ["column_name", "column_name"]
    indexes: ["column_name", "column_name"]
    partition_keys: ["column_name", "column_name"]
    create_process: {
      sql_step:
      CREATE TABLE ${SQL_TABLE_NAME}
      (customer_id int(11),
      lifetime_orders int(11)) ;;
      sql_step:
      INSERT INTO ${SQL_TABLE_NAME}
      (customer_id,
      lifetime_orders)
      SELECT customer_id, COUNT(*)
      AS lifetime_orders
      FROM order
      GROUP BY customer_id ;;
    }
    sql_create: SQL query ;;
  }

  filter: filter {
    bypass_suggest_restrictions: no
    case_sensitive: yes
    datatype: date
    default_value: "2019-01-01"
    full_suggestions: no
    group_label: "Filters"
    group_item_label: "Filters"
    required_fields: [field_name, creation_date]
    suggestions: ["2019-01-01", "2019-02-02", "2019-03-03"]
    suggest_persist_for: "24 hours"
    sql: SQL query ;;
    alias: [F1, Fil]
    convert_tz: yes
    description: "Filter 1"
    hidden: no
    label: "Filter 1"
    required_access_grants: [access_grant_name, access_grant_name_2]
    suggestable: yes
    tags: ["tag1", "tag2"]
    suggest_dimension: field_name
    suggest_explore: view_name
    view_label: "All Fields"
  }

  filter: filter_2 {
    bypass_suggest_restrictions: yes
    case_sensitive: no
    datatype: yyyymmdd
    default_value: "Default"
    full_suggestions: yes
    group_label: "Filters"
    group_item_label: "Filters"
    required_fields: [field_name, creation_date]
    suggestions: ["ONE", "TWO", "THREE"]
    suggest_persist_for: "12 hours"
    sql: SQL query ;;
    alias: [F1, Fil]
    convert_tz: no
    description: "Filter 2"
    hidden: yes
    label: "Filter 2"
    required_access_grants: [access_grant_name, access_grant_name_2]
    suggestable: no
    tags: ["tag1", "tag2"]
    suggest_dimension: field_name
    suggest_explore: view_name
    view_label: "All Fields"
  }

  parameter: parameter {
    type: date_time
    allowed_value: {
      label: "desired label name"
      value: "looker_filter_expression"
    }
    allowed_value: {
      label: "desired label name 2"
      value: "looker_filter_expression_2"
    }
    bypass_suggest_restrictions: yes
    default_value: "looker_filter_expression"
    full_suggestions: yes
    required_fields: [field_name]
    suggestions: ["field_name"]
    suggest_persist_for: "24 hours"
    alias: [param]
    convert_tz: no
    description: "Description"
    hidden: no
    label: "Parameter"
    required_access_grants: [access_grant_name, access_grant_name_2]
    suggestable: yes
    tags: ["tag1", "tag2"]
    suggest_dimension: field_name
    suggest_explore: view_name
    view_label: "All Fields"
  }

  parameter: parameter_2 {
    type: unquoted
    allowed_value: {
      label: "desired label name"
      value: "looker_filter_expression"
    }
    allowed_value: {
      label: "desired label name 2"
      value: "looker_filter_expression_2"
    }
    bypass_suggest_restrictions: no
    default_value: "looker_filter_expression"
    full_suggestions: no
    required_fields: [field_name]
    suggestions: ["field_name"]
    suggest_persist_for: "24 hours"
    alias: [param2]
    convert_tz: yes
    description: "Description 2"
    hidden: yes
    label: "Parameter 2"
    required_access_grants: [access_grant_name, access_grant_name_2]
    suggestable: no
    tags: ["tag1", "tag2"]
    suggest_dimension: field_name
    suggest_explore: view_name
    view_label: "All Fields"
  }


  dimension_group: date_interval {
    allow_fill: no
    bypass_suggest_restrictions: no
    can_filter: no
    datatype: epoch
    drill_fields: [creation_date]
    fanout_on: "fanout"
    full_suggestions: no
    group_label: "Intervals"
    group_item_label: "Intervals"
    html: <html></html> ;;
    intervals: [day, month, year]
    order_by_field: days_date_interval
    skip_drill_filter: yes
    sql_start: ${TABLE}.CREATION_DATE ;;
    sql_end: ${TABLE}.CREATION_DATE ;;
    alias: [interval]
    convert_tz: no
    description: "Date Interval"
    hidden: no
    label: "Date Interval"
    required_access_grants: [access_grant_name, access_grant_name_2]
    suggestable: yes
    tags: ["tag1", "tag2"]
    type: duration
    suggest_dimension: field_name
    suggest_explore: view_name
    view_label: "All Fields"
  }

  dimension_group: creation {
    allow_fill: no
    bypass_suggest_restrictions: yes
    can_filter: yes
    datatype: datetime
    drill_fields: [field_name]
    fanout_on: "repeated_record_name"
    full_suggestions: no
    group_label: "dates"
    group_item_label: "dates"
    html: <html></html> ;;
    order_by_field: creation_date
    skip_drill_filter: yes
    alias: [create]
    convert_tz: no
    description: "Creation Date"
    hidden: yes
    label: "Creation Date"
    required_access_grants: [access_grant_name, access_grant_name_2]
    suggestable: yes
    tags: ["tag1", "tag2"]
    type: time
    suggest_explore: view_name
    suggest_dimension: creation_date
    view_label: "All Fields"

    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATION_DATE ;;


  }

  dimension: field_name {
    action: {
      label: "Label to Appear in Action Menu"
      url: "url"
      icon_url: "url"
      form_url: "url"
      user_attribute_param: {
        user_attribute: user_attribute_name
        name: "name_for_json_payload"
      }
      user_attribute_param: {
        user_attribute: user_attribute_name
        name: "name_for_json_payload"
      }
      param: {
        name: "name string"
        value: "value string"
      }
      param: {
        name: "name string"
        value: "value string"
      }
      form_param: {
        name: "form_param_name_1"
        type: select
        label: "desired label name"
        required: yes
        default: "value string"
        option: {
          name: "name string"
          label: "value string"
        }
        option: {
          name: "name string"
          label: "value string"
        }
      }
      form_param: {
        name: "title"
        type: string
        label: "desired label name"
        required: no
        default: "value string"
        option: {
          name: "name string"
          label: "value string"
        }
        option: {
          name: "name string"
          label: "value string"
        }
      }
    }
    action: {
      label: "Another Label to Appear in Action Menu"
      url: "url"
      icon_url: "url"
      form_url: "url"
      param: {
        name: "name string"
        value: "value string"
      }
      form_param: {
        name: "form_param_name_1"
        type: select
        label: "desired label name"
        required: yes
        default: "value string"
        option: {
          name: "name string"
          label: "value string"
        }
      }
    }
    label: "desired label name"
    label_from_parameter: parameter_name
    view_label: "desired label name"
    group_label: "label used to group dimensions in the field picker"
    group_item_label: "label to use for the field under its group label in the field picker"
    description: "description string"
    hidden: no
    alias: [old_field_name, old_field_name]
    value_format: "excel-style formatting string"
    value_format_name: format_name
    html: HTML expression using Liquid template elements ;;
    sql: SQL expression to generate the field value ;;
    required_fields: [field_name, field_name]
    drill_fields: [field_or_set, field_or_set]
    can_filter: no
    fanout_on: "repeated_record_name"
    tags: ["string1", "string2"]
    type: string
    primary_key: no
    case: {
      when: {
        sql: SQL condition ;;
        label: "value"
      }
      when: {
        sql: SQL condition ;;
        label: "value"
      }
    }
    alpha_sort: no
    tiers: [5, 10, 20, 30, 40]
    style: relational
    sql_latitude: SQL expression to generate a latitude ;;
    sql_longitude: SQL expression to generate a longitude ;;
    suggestable: no
    suggest_persist_for: "N hours"
    suggest_dimension: dimension_name
    suggest_explore: explore_name
    suggestions: ["suggestion string", "suggestion string"]
    required_access_grants: [access_grant_name, access_grant_name_2]
    bypass_suggest_restrictions: no
    full_suggestions: no
    skip_drill_filter: no
    case_sensitive: no
    order_by_field: dimension_name
    map_layer_name: name_of_map_layer
    link: {
      label: "desired label name;"
      url: "desired_url"
      icon_url: "url_of_an_ico_file"
    }
    link: {
      label: "desired label name;"
      url: "desired_url"
      icon_url: "url_of_an_ico_file"
    }
    convert_tz: no
    datatype: timestamp
    sql_start: SQL expression for start time of duration ;;
    sql_end: SQL expression for end time of duration ;;
  }

  measure: measure_name {
    action: {
      label: "Label to Appear in Action Menu"
      url: "url"
      icon_url: "url"
      form_url: "url"
      user_attribute_param: {
        user_attribute: user_attribute_name
        name: "name_for_json_payload"
      }
      user_attribute_param: {
        user_attribute: user_attribute_name
        name: "name_for_json_payload"
      }
      param: {
        name: "name string"
        value: "value string"
      }
      param: {
        name: "name string"
        value: "value string"
      }
      form_param: {
        name: "form_param_name_1"
        type: select
        label: "desired label name"
        required: yes
        default: "value string"
        option: {
          name: "name string"
          label: "value string"
        }
        option: {
          name: "name string"
          label: "value string"
        }
      }
      form_param: {
        name: "title"
        type: string
        label: "desired label name"
        required: no
        default: "value string"
        option: {
          name: "name string"
          label: "value string"
        }
        option: {
          name: "name string"
          label: "value string"
        }
      }
    }
    action: {
      label: "Another Label to Appear in Action Menu"
      url: "url"
      icon_url: "url"
      form_url: "url"
      param: {
        name: "name string"
        value: "value string"
      }
      form_param: {
        name: "form_param_name_1"
        type: select
        label: "desired label name"
        required: yes
        default: "value string"
        option: {
          name: "name string"
          label: "value string"
        }
      }
    }
    approximate: yes
    approximate_threshold: 100
    can_filter: no
    datatype: epoch
    direction: "column"
    drill_fields: [creation_date, field_name]
    fanout_on: "fanout"
    filters: {
      field: field_name
      value: "Value"
    }
    filters: {
      field: creation_date
      value: ">= 2019-01-01"
    }
    group_label: "Measure Group"
    html: <html></html> ;;
    label_from_parameter: parameter
    link: {
      label: "Link Label"
      url: "https://google.com"
      icon_url: "https://goog.com/images"
    }
    link: {
      label: "Link Label 2"
      url: "https://google.com"
      icon_url: "https://goog.com/images"
    }
    list_field: field_name
    percentile: 50
    precision: 4
    required_fields: [field_name, creation_date]
    sql: ${TABLE}.field_name ;;
    sql_distinct_key: ${field_name} ;;
    value_format_name: percent_1
    value_format: "#%"
    alias: [pct]
    convert_tz: no
    description: "Percentile %"
    hidden: no
    label: "Percentile %"
    required_access_grants: [access_grant_name, access_grant_name_2]
    suggestable: yes
    tags: ["tag1", "tag2"]
    type: percentile_distinct
    suggest_explore: view_name
    suggest_dimension: creation_date
    view_label: "All Fields"
  }

  set: set_name {
    fields: [days_date_interval, creation_date, field_name]
  }

  set: set_name_2 {
    fields: [days_date_interval, field_name]
  }
}
