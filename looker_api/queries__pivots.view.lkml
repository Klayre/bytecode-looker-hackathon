view: queries__pivots {
  view_label: "Queries"
#    sql: select  q.id,
#                 q.pivots::variant as pivots,
#                 qp.value::varchar as pivot_field
#         from looker.queries q
#         , lateral flatten(input => q.pivots) qp ;;

  dimension: pivots_pk {
    group_label: "Pivots"
    label: "pivots PK"
    type: string
    primary_key: yes
    sql: ${queries.id} || '-' || ${pivot_field} ;;
    hidden: yes
  }

  dimension: pivot_field {
    group_label: "Pivots"
    label: "Pivot Field"
    type: string
    sql: qp.value::varchar ;;
  }


  set: detail {
    fields: [
      queries.id,
      pivot_field
    ]
  }
}
