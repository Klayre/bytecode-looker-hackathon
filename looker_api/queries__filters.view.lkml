view: queries__filters {
  view_label: "Queries"
#    sql: select  q.id,
#         qfil.key,
#         qfil.value::varchar
#         from looker.queries q
#         , lateral flatten(input => q.filters) qfil; ;;

  dimension: filters_pk {
    group_label: "Filters"
    label: "Filters PK"
    type: string
    primary_key: yes
    sql: ${queries.id} || '-' || ${filter_field} || '-' || ${filter_value} ;;
    hidden: yes
  }

  dimension: filter_field {
    group_label: "Filters"
    label: "Filter Field"
    type: string
    sql: qfil.key ;;
  }

  dimension: filter_value {
    group_label: "Filters"
    label: "Filter Value"
    type: string
    sql: qfil.value::varchar ;;
  }


  set: detail {
    fields: [
      queries.id,
      filter_field,
      filter_value
    ]
  }
}
