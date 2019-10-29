view: merge_queries__source_queries {
  view_label: "Merge Queries"
  derived_table: {
    sql: select  select mq.id as merge_query_id,
                    mq.source_queries as source_queries,
                    mqsq.value::variant as merge_query,
                    mqsq.value:name::varchar as query_name,
                    mqsq.value:query_id::varchar as query_id,
                    mqsq.value:merge_fields::variant as merge_fields
            from looker.merge_queries mq
            , lateral flatten(input => mq.source_queries) mqsq ;;
  }

  dimension: merge_source_query_pk {
    group_label: "Source Query"
    label: "Merge Source Query PK"
    type: string
    primary_key: yes
    sql: ${merge_query_id} || '-' || ${query_id} || '-' ${query_name} ;;
    hidden: yes
  }

  dimension: merge_query_id {
    group_label: "Source Query"
    label: "Merge Query ID"
    type: string
    sql: ${TABLE}.merge_query_id ;;
  }

  dimension: query_name {
    group_label: "Source Query"
    label: "Merge Source Query Name"
    type: string
    sql: ${TABLE}.query_name ;;
  }

  dimension: query_id {
    group_label: "Source Query"
    label: "Query ID"
    type: string
    sql: ${TABLE}.query_id ;;
  }

  dimension: merge_fields {
    group_label: "Source Query"
    label: "Merge Fields JSON"
    type: string
    sql: ${TABLE}.merge_fields ;;
    hidden: yes
  }

  measure: count {
    label: "Number of Merge Source Queries"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      merge_query_id,
      query_id,
      query_name
    ]
  }
}
