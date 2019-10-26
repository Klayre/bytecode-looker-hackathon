view: queries__pivots {
  view_label: "Queries"
  derived_table: {
   sql: select  q.id as query_id,
                q.pivots::variant as pivots,
                qp.value::varchar as pivot_field
        from looker.queries q
        , lateral flatten(input => q.pivots) qp ;;
  }

  dimension: pivots_pk {
    group_label: "Pivot Fields"
    label: "pivots PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${pivot_field} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Pivot Fields"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: pivot_field {
    group_label: "Pivot Fields"
    label: "Pivot Field"
    type: string
    sql: ${TABLE}.pivot_field ;;
  }

  measure: count {
    label: "Number of Pivot Fields"
    type: count_distinct
    sql: ${pivots_pk} ;;
  }

  set: detail {
    fields: [
      query_id,
      pivot_field
    ]
  }
}
