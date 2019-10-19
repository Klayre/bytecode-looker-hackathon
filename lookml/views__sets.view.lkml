view: views__sets {
  view_label: "Views"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.sets::variant as sets,
#                   "set".value::variant as "set",
#                   "set".value:name::varchar as set_name,
#                   sfld.value::varchar as field_name
#           from lookml.views v
#           , lateral flatten(input => v.sets) "set"
#           , lateral flatten(input => "set".value:fields) sfld ;;

  dimension: sets_pk {
    group_label: "Sets"
    label: "Sets PK"
    type: string
    primary_key: yes
    sql: ${views.view_pk} || '-' || ${set_name} || '-' || ${field_name}  ;;
    hidden: yes
  }

  dimension: sets_key {
    group_label: "Sets"
    label: "Sets Key"
    type: string
    sql: ${views.view_pk} || '-' || ${set_name} ;;
    hidden: yes
  }

  dimension: set_name {
    group_label: "Sets"
    label: "Set Name"
    type: string
    sql: "set".value:name::varchar ;;
  }

  dimension: field_name {
    group_label: "Sets"
    label: "Field Name"
    type: string
    sql: sfld.value::varchar ;;
  }

  measure: count {
    label: "Number of Set Fields"
    type: count
    drill_fields: [detail*, field_name]
  }

  measure: count_sets {
    label: "Number of Sets"
    type: count_distinct
    sql: ${sets_pk} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      set_name
    ]
  }
}
