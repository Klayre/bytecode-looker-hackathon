view: queries__fill_fields {
  view_label: "Queries"
#    sql: select  q.id,
#                 q.fill_fields::variant as fill_fields,
#                 qfill.value::varchar as fill_field
#         from looker.queries q
#         , lateral flatten(input => q.fill_fields) qfill ;;

  dimension: fills_pk {
    group_label: "Fill Fields"
    label: "Fill Fields PK"
    type: string
    primary_key: yes
    sql: ${queries.id} || '-' || ${fill_field} ;;
    hidden: yes
  }

  dimension: fill_field {
    group_label: "Fill Fields"
    label: "Fill Field"
    type: string
    sql: qfill.value::varchar ;;
  }


  set: detail {
    fields: [
      queries.id,
      fill_field
    ]
  }
}
