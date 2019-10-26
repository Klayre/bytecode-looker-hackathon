view: queries__fields_select {
  view_label: "Queries"
  derived_table: {
   sql: select  q.id as query_id,
                q.fields::variant as fields,
                qf.value::varchar as field_name
        from looker.queries q
        , lateral flatten(input => q.fields) qf ;;
  }
  dimension: fields_pk {
    group_label: "Select Fields"
    label: "Fields PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${field_name} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Select Fields"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Select Fields"
    label: "Field Name"
    type: string
    sql: ${TABLE}.field_name ;;
  }

  measure: count {
    label: "Number of Select Fields"
    type: count_distinct
    sql: ${fields_pk} ;;
  }

  set: detail {
    fields: [
      query_id,
      field_name
    ]
  }
}
