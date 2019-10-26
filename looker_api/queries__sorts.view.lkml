view: queries__sorts {
  view_label: "Queries"
#    sql: select  q.id,
#                 q.sorts::variant as sorts,
#                 qs.value::varchar as sort_field
#         from looker.queries q
#         , lateral flatten(input => q.sorts) qs ;;

  dimension: sorts_pk {
    group_label: "Sorts"
    label: "Sorts PK"
    type: string
    primary_key: yes
    sql: ${queries.id} || '-' || ${sort_field} ;;
    hidden: yes
  }

  dimension: sort_field {
    group_label: "Sorts"
    label: "Sort Field"
    type: string
    sql: qs.value::varchar ;;
  }


  set: detail {
    fields: [
      queries.id,
      sort_field
    ]
  }
}
