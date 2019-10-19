view: views__derived_table__cluster_keys {
  view_label: "Derived Table"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.derived_table:cluster_keys::variant as cluster_keys,
#                   ck.value::varchar as column_name
#           from lookml.views v
#           , lateral flatten(input => v.derived_table:cluster_keys) ck ;;

  dimension: cluster_keys_pk {
    group_label: "Cluster Keys"
    label: "Cluster Keys PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${column_name}  ;;
    hidden: yes
  }

  dimension: column_name {
    group_label: "Cluster Keys"
    label: "Column Name"
    type: string
    sql: ck.value::varchar ;;
  }

  measure: count {
    label: "Number of Cluster Key Columns"
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
