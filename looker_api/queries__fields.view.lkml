view: queries__fields {
  view_label: "Queries"
  derived_table: {
   sql: select  q.id as query_id,
                q.fields::variant as fields,
                qf.value::varchar as field_name
        from looker.queries q
        , lateral flatten(input => q.fields) qf ;;
  }
  dimension: fields_pk {
    group_label: "Fields"
    label: "Fields PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${field_name} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Fields"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Fields"
    label: "Field Name"
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: is_fill_field {
    group_label: "Fields"
    label: "Is Fill Field"
    type: yesno
    sql: ${queries__fill_fields.fill_field} is not null ;;
  }

  dimension: is_filter_field {
    group_label: "Fields"
    label: "Is Filter Field"
    type: yesno
    sql: ${queries__filter_fields.filter_field} is not null ;;
  }

  dimension: is_pivot_field {
    group_label: "Fields"
    label: "Is Pivot Field"
    type: yesno
    sql: ${queries__pivots.pivot_field} is not null ;;
  }

  dimension: is_sort_field {
    group_label: "Fields"
    label: "Is Sort Field"
    type: yesno
    sql: ${queries__sorts.sort_field} is not null ;;
  }

  set: detail {
    fields: [
      query_id,
      field_name
    ]
  }
}
