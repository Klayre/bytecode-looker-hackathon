view: views__derived_table__explore_source__derived_columns {
  view_label: "Derived Table: Explore Source - Derived Columns"
#     sql: select  v.sha as view_sha,
#                 v.path as view_path,
#                 v.name as view_name,
#                 v.derived_table:explore_source:name::varchar as explore_source_name,
#                 v.derived_table:explore_source:derived_columns::variant as derived_columns,
#                 esdc.value:name::varchar as column_name,
#                 esdc.value:sql::varchar as sql
#         from lookml.views v
#         , lateral flatten(input => v.derived_table:explore_source:derived_columns) esdc ;;

  dimension: derived_columns_pk {
    label: "Derived Columns PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${column_name} ;;
    hidden: yes
  }

  dimension: column_name {
    label: "Column Name"
    type: string
    sql: esdc.value:name::varchar ;;
  }

  dimension: sql {
    label: "SQL"
    type: string
    sql: esdc.value:sql::varchar ;;
  }

  measure: count {
    label: "Number of Explore Source Derived Columns"
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
      sql
    ]
  }
}
