view: views__dimension_groups__timeframes {
  view_label: "Dimension Groups"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimension_groups,
#                   dg.value::variant as dimension_group,
#                   dg.value:name::varchar as dimension_group_name,
#                   dg.value:timeframes::variant as timeframes,
#                   dgtf.value::varchar as timeframe
#           from lookml.views v
#           , lateral flatten(input => v.dimension_groups) dg
#           , lateral flatten(input => dg.value:timeframes) dgtf ;;

  dimension: timeframes_pk {
    group_label: "Timeframes"
    label: "Timeframes PK"
    type: string
    primary_key: yes
    sql: ${views__dimension_groups.dimension_group_pk} || '-' || ${timeframe}  ;;
    hidden: yes
  }

  dimension: timeframe {
    group_label: "Timeframes"
    label: "Timeframe"
    type: string
    sql: dgtf.value::varchar ;;
  }

  measure: count {
    label: "Number of Timeframes"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__dimension_groups.name,
      timeframe
    ]
  }
}
