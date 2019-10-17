view: views__derived_table__explore_source__columns {
  view_label: "Derived Table: Explore Source - Columns"
#     sql: select  v.sha as view_sha,
#                 v.path as view_path,
#                 v.name as view_name,
#                 v.derived_table:explore_source:name::varchar as explore_source_name,
#                 v.derived_table:explore_source:columns::variant as "columns",
#                 esc.value:name::varchar as column_name,
#                 esc.value:field::varchar as field_name
#         from lookml.views v
#         , lateral flatten(input => v.derived_table:explore_source:columns) esc ;;

  dimension: columns_pk {
    label: "Columns PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${column_name} || '-' || ${field_name} ;;
    hidden: yes
  }

  dimension: column_name {
    label: "Column Name"
    type: string
    sql: esc.value:name::varchar ;;
  }

  dimension: field_name {
    label: "Field Name"
    type: string
    sql: esc.value:field::varchar ;;
  }

  measure: count {
    label: "Number of Explore Source Columns"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views.derived_table__explore_source__name,
      column_name,
      field_name
    ]
  }
}
