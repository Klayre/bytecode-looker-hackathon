view: views__derived_table__partition_keys {
  view_label: "Derived Table: Partition Keys"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.derived_table:parition_keys::variant as partition_keys,
#                   pk.value::varchar as column_name
#           from lookml.views v
#           , lateral flatten(input => v.derived_table:parition_keys) pk ;;

  dimension: partition_keys_pk {
    label: "Partition Keys PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${column_name}  ;;
    hidden: yes
  }

  dimension: column_name {
    label: "Column Name"
    type: string
    sql: pk.value::varchar ;;
  }

  measure: count {
    label: "Number of Partition Key Columns"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      column_name
    ]
  }
}
