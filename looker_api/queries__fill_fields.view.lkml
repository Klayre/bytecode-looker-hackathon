view: queries__fill_fields {
  view_label: "Queries"
  derived_table: {
   sql: select  q.id as query_id,
                q.fill_fields::variant as fill_fields,
                qfill.value::varchar as fill_field
        from looker.queries q
        , lateral flatten(input => q.fill_fields) qfill ;;
  }

  dimension: fills_pk {
    group_label: "Fill Fields"
    label: "Fill Fields PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${fill_field} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Fill Fields"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: fill_field {
    group_label: "Fill Fields"
    label: "Fill Field"
    type: string
    sql: ${TABLE}.fill_field ;;
  }

  measure: count {
    label: "Number of Fill Fields"
    type: count_distinct
    sql: ${fills_pk} ;;
  }

  set: detail {
    fields: [
      query_id,
      fill_field
    ]
  }
}
