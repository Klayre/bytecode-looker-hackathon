view: queries__dynamic_fields {
  view_label: "Queries"
#    sql: select  q.id,
#         q.dynamic_fields,
#         qdf.value::variant as dynamic_field,
#         qdf.value:dimension::varchar as dimension,
#         qdf.value:label::varchar as label,
#         qdf.value:expression::varchar as expression,
#         qdf.value:value_format::varchar as value_format,
#         qdf.value:value_format_name::varchar as value_format_name,
#         qdf.value:_kind_hint::varchar as kind_hint,
#         qdf.value:_type_hint::varchar as type_hint
#         from looker.queries q
#         , lateral flatten(input => parse_json(q.dynamic_fields)) qdf ;;

  dimension: dynamic_fields_pk {
    group_label: "Dynamic Fields"
    label: "Dynamic Fields PK"
    type: string
    primary_key: yes
    sql: ${queries.id} || '-' || ${label} ;;
    hidden: yes
  }

  dimension: dimension {
    group_label: "Dynamic Fields"
    label: "Dimension"
    type: string
    sql: qdf.value:dimension::varchar ;;
  }

  dimension: label {
    group_label: "Dynamic Fields"
    label: "Label"
    type: string
    sql: qdf.value:label::varchar ;;
  }

  dimension: expression {
    group_label: "Dynamic Fields"
    label: "Expression"
    type: string
    sql: qdf.value:expression::varchar ;;
  }

  dimension: value_format {
    group_label: "Dynamic Fields"
    label: "Value Format"
    type: string
    sql: qdf.value:value_format::varchar ;;
  }

  dimension: value_format_name {
    group_label: "Dynamic Fields"
    label: "Value Format Name"
    type: string
    sql: qdf.value:value_format_name::varchar ;;
  }

  dimension: kind_hint {
    group_label: "Dynamic Fields"
    label: "Kind Hint"
    type: string
    sql: qdf.value:_kind_hint::varchar ;;
  }

  dimension: type_hint {
    group_label: "Dynamic Fields"
    label: "Type Hint"
    type: string
    sql: qdf.value:_type_hint::varchar ;;
  }


  set: detail {
    fields: [
      queries.id,
      label,
      expression,
      dimension,
      value_format,
      value_format_name,
      kind_hint,
      type_hint
    ]
  }
}
