view: views__dimension_groups__intervals {
  view_label: "Dimension Groups"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimension_groups,
#                   dg.value::variant as dimension_group,
#                   dg.value:name::varchar as dimension_group_name,
#                   dg.value:intervals::variant as intervals,
#                   dgint.value::varchar as interval
#           from lookml.views v
#           , lateral flatten(input => v.dimension_groups) dg
#           , lateral flatten(input => dg.value:intervals) dgint ;;

  dimension: intervals_pk {
    group_label: "Intervals"
    label: "Intervals PK"
    type: string
    primary_key: yes
    sql: ${views__dimension_groups.dimension_group_pk} || '-' || ${interval}  ;;
    hidden: yes
  }

  dimension: interval {
    group_label: "Intervals"
    label: "Interval"
    type: string
    sql: dgint.value::varchar ;;
  }

  measure: count {
    label: "Number of Intervals"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__dimension_groups.name,
      interval
    ]
  }
}
