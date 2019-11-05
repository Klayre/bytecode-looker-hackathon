view: queries__fields_all {
  view_label: "Queries"
  derived_table: {
    sql:
        select q.id as query_id,
        qf.value::varchar as field_name
        from looker.queries q
        , lateral flatten(input => q.fields) qf

        UNION

        select  q.id as query_id,
        qfil.key::varchar as field_name
        from looker.queries q
        , lateral flatten(input => q.filters) qfil
         ;;
  }
  dimension: fields_pk {
    group_label: "Fields All"
    label: "Fields PK"
    type: string
    primary_key: yes
    sql: ${query_id} || '-' || ${field_name} ;;
    hidden: yes
  }

  dimension: query_id {
    group_label: "Fields All"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Fields All"
    label: "Field Name"
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: is_select_field {
    group_label: "Fields All"
    label: "Is Select Field"
    type: yesno
    sql: ${queries__fields_select.field_name} is not null ;;
  }

  dimension: is_fill_field {
    group_label: "Fields All"
    label: "Is Fill Field"
    type: yesno
    sql: ${queries__fill_fields.fill_field} is not null ;;
  }

  dimension: is_filter_field {
    group_label: "Fields All"
    label: "Is Filter Field"
    type: yesno
    sql: ${queries__filter_fields.filter_field} is not null ;;
  }

  dimension: is_pivot_field {
    group_label: "Fields All"
    label: "Is Pivot Field"
    type: yesno
    sql: ${queries__pivots.pivot_field} is not null ;;
  }

  dimension: is_sort_field {
    group_label: "Fields All"
    label: "Is Sort Field"
    type: yesno
    sql: ${queries__sorts.sort_field} is not null ;;
  }

  measure: count {
    label: "Number of Query Fields"
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
