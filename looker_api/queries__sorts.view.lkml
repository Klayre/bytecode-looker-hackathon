view: queries__sorts {
  view_label: "Queries"
  derived_table: {
   sql: select  q.id as query_id,
                q.sorts::variant as sorts,
                qs.value::varchar as sort_field
        from looker.queries q
        , lateral flatten(input => q.sorts) qs ;;
   }

  dimension: sorts_pk {
    group_label: "Sorts"
    label: "Sorts PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${sort_field} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Sorts"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: sort_field {
    group_label: "Sorts"
    label: "Sort Field"
    type: string
    sql: ${TABLE}.sort_field ;;
  }

  set: detail {
    fields: [
      query_id,
      sort_field
    ]
  }
}
