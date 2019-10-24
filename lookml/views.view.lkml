view: views {
  sql_table_name: LOOKML.VIEWS ;;
  view_label: "Views"

  dimension: view_pk {
    label: "View PK"
    type: string
    primary_key: yes
    sql: ${git_owner} || '-' || ${git_repository} || '-' || ${path} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: view_key {
    label: "View Key"
    type: string
    hidden: yes
    sql: ${git_owner} || '-' || ${git_repository} || '-' || ${name} ;;
  }

  dimension: view_file_key {
    label: "View File Key"
    type: string
    sql: ${git_owner} || '-' || ${git_repository} || '-' || ${path} ;;
    hidden: yes
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._SDC_BATCHED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._SDC_EXTRACTED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
    hidden: yes
  }

  dimension: derived_table {
    view_label: "Derived Table"
    label: "Derived Table JSON"
    type: string
    sql: ${TABLE}.DERIVED_TABLE ;;
    hidden: yes
  }

  dimension: derived_table__cluster_keys {
    view_label: "Derived Table"
    group_label: "Cluster Keys"
    label: "Cluster Keys JSON"
    type: string
    sql: ${derived_table}:cluster_keys::variant ;;
    hidden: yes
  }

  dimension: derived_table__cluster_keys_list {
    view_label: "Derived Table"
    group_label: "Cluster Keys"
    label: "Cluster Keys List"
    type: string
    sql:array_to_string(parse_json(${derived_table__cluster_keys}), ', ') ;;
  }

  dimension: derived_table__create_process {
    view_label: "Derived Table"
    label: "Create Process JSON"
    type: string
    sql: ${derived_table}:create_process::variant ;;
    hidden: yes
  }

  dimension: derived_table__datagroup_trigger {
    view_label: "Derived Table"
    group_label: "Persist"
    label: "Datagroup Trigger"
    type: string
    sql: ${derived_table}:datagroup_trigger::varchar ;;
  }

  dimension: derived_table__distribution {
    view_label: "Derived Table"
    label: "Distribution"
    type: string
    sql: ${derived_table}:distribution::varchar ;;
  }

  dimension: derived_table__distribution_style {
    view_label: "Derived Table"
    label: "Distribution Style"
    type: string
    sql: ${derived_table}:distribution_style::varchar ;;
  }

  dimension: derived_table__explore_source {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Explore Source JSON"
    type: string
    sql: ${derived_table}:explore_source::variant ;;
    hidden: yes
  }

  dimension: derived_table__explore_source__bind_filters {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Bind Filters JSON"
    type: string
    sql: ${derived_table}:explore_source:bind_filters::variant ;;
    hidden: yes
  }

  dimension: derived_table__explore_source__bind_filters__from_field {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Bind Filters From Field"
    type: string
    sql: ${derived_table}:explore_source:bind_filters:from_field::varchar ;;
  }

  dimension: derived_table__explore_source__bind_filters__to_field {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Bind Filters To Field"
    type: string
    sql: ${derived_table}:explore_source:bind_filters:to_field::varchar ;;
  }

  dimension: derived_table__explore_source__columns {
    view_label: "Derived Table"
    group_label: "Explore Source: Columns"
    label: "Colunns JSON"
    type: string
    sql: ${derived_table}:explore_source:columns::variant ;;
    hidden: yes
  }

  dimension: derived_table__explore_source__derived_columns {
    view_label: "Derived Table"
    group_label: "Explore Source: Derived Columns"
    label: "Derived Colunns JSON"
    type: string
    sql: ${derived_table}:explore_source:derived_columns::variant ;;
    hidden: yes
  }

  dimension: derived_table__explore_source__filters {
    view_label: "Derived Table"
    group_label: "Explore Source: Filters"
    label: "Filters JSON"
    type: string
    sql: ${derived_table}:explore_source:filters::variant ;;
    hidden: yes
  }

  dimension: derived_table__explore_source__expression_custom_filter {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Expression Custom Filter"
    type: string
    sql: ${derived_table}:explore_source:expression_custom_filter::varchar ;;
  }

  dimension: derived_table__explore_source__limit {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Limit"
    type: number
    sql: ${derived_table}:explore_source:limit::integer ;;
  }

  dimension: derived_table__explore_source__name {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Explore Source Name"
    type: string
    sql: ${derived_table}:explore_source:name::varchar ;;
  }

  dimension: derived_table__explore_source__sort__desc {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Sort Descending"
    type: string
    sql: ${derived_table}:explore_source:sort:desc::varchar ;;
  }

  dimension: derived_table__explore_source__sort__field {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Sort Field"
    type: string
    sql: ${derived_table}:explore_source:sort:field::varchar ;;
  }

  dimension: derived_table__explore_source__timezone {
    view_label: "Derived Table"
    group_label: "Explore Source"
    label: "Timezone"
    type: string
    sql: ${derived_table}:explore_source:timezone::varchar ;;
  }

  dimension: derived_table__indexes {
    view_label: "Derived Table"
    group_label: "Indexes"
    label: "Indexes JSON"
    type: string
    sql: ${derived_table}:indexes::variant ;;
    hidden: yes
  }

  dimension: derived_table__indexes_list {
    view_label: "Derived Table"
    group_label: "Indexes"
    label: "Indexes List"
    type: string
    sql: array_to_string(parse_json(${derived_table__indexes}), ', ') ;;
  }

  dimension: derived_table__is_derived_table {
    view_label: "Derived Table"
    label: "Is Derived Table"
    type: yesno
    sql: ${derived_table} is not null;;
  }

  dimension: derived_table__is_native_derived_table {
    view_label: "Derived Table"
    label: "Is Native Derived Table"
    type: yesno
    sql: ${derived_table__explore_source} is not null;;
  }

  dimension: derived_table__is_persistent_derived_table {
    view_label: "Derived Table"
    label: "Is Persistent Derived Table"
    type: yesno
    sql: (${derived_table__datagroup_trigger} is not null)
          or (${derived_table__persist_for} is not null)
          or (${derived_table__sql_trigger_value} is not null) ;;
  }

  dimension: derived_table__partition_keys {
    view_label: "Derived Table"
    group_label: "Partition Keys"
    label: "Partition Keys JSON"
    type: string
    sql: ${derived_table}:partition_keys::variant ;;
    hidden: yes
  }

  dimension: derived_table__partition_keys_list {
    view_label: "Derived Table"
    group_label: "Partition Keys"
    label: "Partition Keys List"
    type: string
    sql: array_to_string(parse_json(${derived_table__partition_keys}), ', ') ;;
  }

  dimension: derived_table__persist_for {
    view_label: "Derived Table"
    group_label: "Persist"
    label: "Persist For"
    type: string
    sql: ${derived_table}:persist_for::varchar ;;
  }

  dimension: derived_table__sortkeys {
    view_label: "Derived Table"
    group_label: "Sortkeys"
    label: "Sortkeys JSON"
    type: string
    sql: ${derived_table}:sortkeys::variant ;;
    hidden: yes
  }

  dimension: derived_table__sortkeys_list {
    view_label: "Derived Table"
    group_label: "Sortkeys"
    label: "Sortkeys List"
    type: string
    sql: array_to_string(parse_json(${derived_table__sortkeys}), ', ') ;;
  }

  dimension: derived_table__sql {
    view_label: "Derived Table"
    group_label: "SQL"
    label: "SQL"
    type: string
    sql: ${derived_table}:sql::varchar ;;
  }

  dimension: derived_table__sql_create {
    view_label: "Derived Table"
    group_label: "SQL"
    label: "SQL Create"
    type: string
    sql: ${derived_table}:sql_create::varchar ;;
  }

  dimension: derived_table__sql_trigger_value {
    view_label: "Derived Table"
    group_label: "Persist"
    label: "SQL Trigger Value"
    type: string
    sql: ${derived_table}:sql_trigger_value::varchar ;;
  }

  dimension: dimension_groups {
    view_label: "Dimension Groups JSON"
    type: string
    sql: ${TABLE}.DIMENSION_GROUPS ;;
    hidden: yes
  }

  dimension: dimensions {
    label: "Dimensions JSON"
    type: string
    sql: ${TABLE}.DIMENSIONS ;;
    hidden: yes
  }

  dimension: extends {
    group_label: "Extends"
    label: "Extends JSON"
    type: string
    sql: ${TABLE}.EXTENDS ;;
    hidden: yes
  }

  dimension: extends_list {
    group_label: "Extends"
    label: "Extends List"
    type: string
    sql: array_to_string(parse_json(${extends}), ', ') ;;
  }

  dimension: is_extends {
    group_label: "Extends"
    label: "Is Extends"
    type: string
    sql: ${extends} is not null ;;
  }

  dimension: extension {
    group_label: "Extends"
    label: "Extension"
    type: string
    sql: ${TABLE}.EXTENSION ;;
  }

  dimension: is_extension_required {
    group_label: "Extends"
    label: "Is Extension Required"
    type: string
    sql: ${extension} = 'required' ;;
  }

  dimension: filters {
    label: "Filters JSON"
    type: string
    sql: ${TABLE}.FILTERS ;;
    hidden: yes
  }

  dimension: git_owner {
    group_label: "Git"
    label: "Git Owner"
    type: string
    sql: ${TABLE}.GIT_OWNER ;;
  }

  dimension: git_repository {
    group_label: "Git"
    label: "Git Repository"
    type: string
    sql: ${TABLE}.GIT_REPOSITORY ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.LAST_MODIFIED ;;
  }

  dimension: measures {
    label: "Measures JSON"
    type: string
    sql: ${TABLE}.MEASURES ;;
    hidden: yes
  }

  dimension: name {
    label: "View Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: parameters {
    label: "Parameters JSON"
    type: string
    sql: ${TABLE}.PARAMETERS ;;
    hidden: yes
  }

  dimension: path {
    group_label: "Git"
    label: "View Path"
    type: string
    sql: ${TABLE}.PATH ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants JSON"
    type: string
    sql: ${TABLE}.REQUIRED_ACCESS_GRANTS ;;
    hidden: yes
  }

  dimension: sets {
    group_label: "Sets"
    label: "Sets JSON"
    type: string
    sql: ${TABLE}.SETS ;;
    hidden: yes
  }

  dimension: sha {
    group_label: "Git"
    label: "View SHA"
    description: "Unique hash key based on file contents"
    type: string
    sql: ${TABLE}.SHA ;;
  }

  dimension: sql_table_name {
    label: "SQL Table Name"
    type: string
    sql: ${TABLE}.SQL_TABLE_NAME ;;
  }

  dimension: suggestions {
    label: "Suggestions"
    type: string
    sql: ${TABLE}.SUGGESTIONS ;;
  }

  dimension: suggestions_yn {
    group_label: "YesNo"
    label: "Suggestions"
    type: string
    sql: ${suggestions} = 'yes' ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: ${TABLE}.VIEW_LABEL ;;
  }

  measure: count {
    label: "Number of Views"
    type: count
    drill_fields: [detail*]
  }

  measure: count_extended_views {
    label: "Number of Extended Views"
    type: count
    filters: {
      field: is_extends
      value: "Yes"
    }
    drill_fields: [detail*]
  }

  measure: count_derived_tables {
    label: "Number of Derived Tables"
    type: count
    filters: {
      field: derived_table__is_derived_table
      value: "Yes"
    }
    drill_fields: [detail*]
  }

  measure: count_native_derived_tables {
    label: "Number of NDTs"
    type: count
    filters: {
      field: derived_table__is_native_derived_table
      value: "Yes"
    }
    drill_fields: [detail*]
  }

  measure: count_persistent_derived_tables {
    label: "Number of PDTs"
    type: count
    filters: {
      field: derived_table__is_persistent_derived_table
      value: "Yes"
    }
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      path,
      name,
      sql_table_name,
      view_label,
      last_modified_time,
      derived_table__is_derived_table,
      derived_table__is_persistent_derived_table,
      derived_table__is_native_derived_table,
      is_extends
    ]
  }
}
