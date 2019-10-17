view: models__explores__joins__required_joins {
  view_label: "Joins: Required Joins"
#   sql: select  m.sha as model_sha,
#         m.path as model_path,
#         ex.value:name::varchar as explore_name,
#         ex.value:joins::variant as joins_json,
#         j.value:name::varchar as join_name,
#         j.value:required_joins::variant as required_joins,
#         jrj.value::varchar as view_name
#         from lookml.models m
#         , lateral flatten(input => m.explores) ex
#         , lateral flatten(input => ex.value:joins) j
#         , lateral flatten(input => j.value:required_access_grants) jrj ;;

  dimension: required_joins_pk {
    label: "Required Joins PK"
    type: string
    primary_key: yes
    sql: ${models__explores__joins.joins_pk} || '-' || ${view_name} ;;
    hidden: yes
  }

  dimension: view_name {
    label: "View Name"
    type: string
    sql: jrag.value::varchar ;;
  }

  measure: count {
    label: "Number of Required Joins"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      models__explores__joins.name,
      view_name
    ]
  }

}
