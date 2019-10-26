view: merge_queries__source_queries__merge_fields {
  view_label: "Merge Queries"
#   sql: select mq.id,
#                   mq.source_queries,
#                   mqsq.value::variant as merge_query,
#                   mqsq.value:name::varchar as name,
#                   mqsq.value:query_id::varchar as query_id,
#                   mqsq.value:merge_fields::variant as merge_fields,
#                   mqsqmf.value:field_name::varchar as field_name,
#                   mqsqmf.value:source_field_name::varchar as source_field_name
#           from looker.merge_queries mq
#           , lateral flatten(input => mq.source_queries) mqsq
#           , lateral flatten(input => mqsq.value:merge_fields) mqsqmf ;;

  dimension: merge_fields_pk {
    group_label: "Source Query - Merge Fields"
    label: "Merge Fields PK"
    type: string
    primary_key: yes
    sql: ${merge_query__source_queries.pk} || '-' || ${field_name} ;;
    hidden: yes
  }

  dimension: field_name {
    group_label: "Source Query - Merge Fields"
    label: "Field Name"
    type: string
    sql: mqsqmf.value:field_name::varchar ;;
  }

  dimension: source_field_name {
    group_label: "Source Query - Merge Fields"
    label: "Source Field Name"
    type: string
    sql: mqsqmf.value:source_field_name::varchar ;;
  }

  measure: count {
    label: "Number of Merge Fields"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      merge_query.id,
      merge_queries__source_queries.query_id,
      merge_queries__source_queries.name,
      field_name,
      source_field_name
    ]
  }
}
