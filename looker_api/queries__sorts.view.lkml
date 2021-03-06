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
    group_label: "Sort Fields"
    label: "Sorts PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${sort_field} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Sort Fields"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: sort_field {
    group_label: "Sort Fields"
    label: "Sort Field"
    type: string
    sql: REPLACE(${TABLE}.sort_field, ' desc', '') ;;
  }

  dimension: sort_direction {
    group_label: "Sort Fields"
    label: "Sort Direction"
    type: string
    sql: CASE WHEN RIGHT(${TABLE}.sort_field, 5) = ' desc' THEN 'descending'
          ELSE 'ascending' END ;;
  }

  measure: count {
    label: "Number of Sort Fields"
    type: count_distinct
    sql: ${sorts_pk} ;;
  }

  set: detail {
    fields: [
      query_id,
      sort_field
    ]
  }
}
