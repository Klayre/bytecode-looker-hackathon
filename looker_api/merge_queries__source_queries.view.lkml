view: merge_queries__source_queries {
  view_label: "Merge Queries"
#   sql: select  select mq.id,
#                   mq.source_queries,
#                   mqsq.value::variant as merge_query,
#                   mqsq.value:name::varchar as name,
#                   mqsq.value:query_id::varchar as query_id,
#                   mqsq.value:merge_fields::variant as merge_fields
#           from looker.merge_queries mq
#           , lateral flatten(input => mq.source_queries) mqsq ;;

  dimension: merge_source_query_pk {
    group_label: "Source Query"
    label: "Merge Source Query PK"
    type: string
    primary_key: yes
    sql: ${merge_query.id} || '-' || ${query_id} || '-' ${name} ;;
    hidden: yes
  }

  dimension: name {
    group_label: "Source Query"
    label: "Merge Source Query Name"
    type: string
    sql: mqsq.value:name::varchar ;;
  }

  dimension: query_id {
    group_label: "Source Query"
    label: "Query ID"
    type: string
    sql: mqsq.value:query_id::varchar ;;
  }

  dimension: merge_fields {
    group_label: "Source Query"
    label: "Merge Fields JSON"
    type: string
    sql: mqsq.value:merge_fields::variant ;;
    hidden: yes
  }


  measure: count {
    label: "Number of Merge Source Queries"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      merge_query.id,
      query_id,
      name
    ]
  }
}
