view: queries__fields {
  view_label: "Queries"
#    sql: select  q.id,
#                 q.fields::variant as fields,
#                 qf.value::varchar as field
#         from looker.queries q
#         , lateral flatten(input => q.fields) qf ;;

  dimension: fields_pk {
    group_label: "Fields"
    label: "Fields PK"
    type: string
    primary_key: yes
    sql: ${queries.id} || '-' || ${field} ;;
    hidden: yes
  }

  dimension: field {
    group_label: "Fields"
    label: "Field"
    type: string
    sql: qf.value::varchar ;;
  }


  set: detail {
    fields: [
      queries.id,
      field
    ]
  }
}
