view: queries__filters {
  view_label: "Queries"
  derived_table: {
   sql: select  q.id as query_id,
        qfil.key as filter_field,
        qfil.value::varchar as filter_value
        from looker.queries q
        , lateral flatten(input => q.filters) qfil ;;
  }

  dimension: filters_pk {
    group_label: "Filter Fields"
    label: "Filters PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${filter_field} || '-' || ${filter_value} ;;
    hidden: yes
  }

  dimension: filter_key {
    group_label: "Filter Fields"
    label: "Filters PK"
    type: string
    sql: ${query_id} || '-' || ${filter_field} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Filter Fields"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: filter_field {
    group_label: "Filter Fields"
    label: "Filter Field"
    type: string
    sql: ${TABLE}.filter_field ;;
  }

  dimension: filter_value {
    group_label: "Filter Fields"
    label: "Filter Value"
    type: string
    sql: ${TABLE}.filter_value ;;
  }

  measure: count_fields {
    label: "Number of Filter Fields"
    type: count_distinct
    sql: ${filter_key} ;;
  }

  measure: count_values {
    label: "Number of Filter Values"
    type: count_distinct
    sql: ${filters_pk} ;;
  }

  set: detail {
    fields: [
      query_id,
      filter_field,
      filter_value
    ]
  }
}
