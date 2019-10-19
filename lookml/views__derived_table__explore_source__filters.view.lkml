view: views__derived_table__explore_source__filters {
  view_label: "Derived Table"
#     sql: select  v.sha as view_sha,
#                 v.path as view_path,
#                 v.name as view_name,
#                 v.derived_table:explore_source:name::varchar as explore_source_name,
#                 v.derived_table:explore_source:filters::variant as filters,
#                 esf.value:field::varchar as column_name,
#                 esf.value:value::varchar as field_name
#         from lookml.views v
#         , lateral flatten(input => v.derived_table:explore_source:filters) esf ;;

  dimension: columns_pk {
    group_label: "Explore Source: Filters"
    label: "Columns PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${field_name} || '-' || ${filter_value} ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Explore Source: Filters"
    label: "Field Name"
    type: string
    sql: esf.value:field::varchar ;;
  }

  dimension: filter_value {
    group_label: "Explore Source: Filters"
    label: "Filter Value"
    type: string
    sql: esf.value:value::varchar ;;
  }

  measure: count {
    label: "Number of Explore Source Filters"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views.derived_table__explore_source__name,
      field_name,
      filter_value
    ]
  }
}
