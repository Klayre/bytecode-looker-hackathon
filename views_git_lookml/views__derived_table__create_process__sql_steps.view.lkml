view: views__derived_table__create_process__sql_steps {
  view_label: "Derived Table: Create Process - SQL Steps"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.derived_table:create_process:sql_steps::variant as sql_steps,
#                   ss.value::varchar as sql_step
#           from lookml.views v
#           , lateral flatten(input => v.derived_table:create_process:sql_steps) ss ;;

  dimension: sql_steps_pk {
    label: "SQL Steps PK"
    type: string
    primary_key: yes
    sql: MD5(${views.view_pk} || '-' || ${sql_step})  ;;
    hidden: yes
  }

  dimension: sql_step {
    label: "SQL Step"
    type: string
    sql: ss.value::varchar ;;
  }

  measure: count {
    label: "Number of SQL Steps"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      sql_step
    ]
  }
}
