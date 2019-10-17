view: models__explores__joins {
  view_label: "Joins"
#     sql: select  m.sha as model_sha,
#                 m.path as model_path,
#                 ex.value:name::varchar as explore_name,
#                 ex.value:joins::variant as joins_json,
#                 j.value:fields::variant as fields,
#                 j.value:foreign_key::varchar as foreign_key,
#                 j.value:from::varchar as "from",
#                 j.value:name::varchar as name,
#                 j.value:outer_only::varchar as outer_only,
#                 j.value:relationship::varchar as relationship,
#                 j.value:required_access_grants::variant as required_access_grants,
#                 j.value:required_joins::variant as required_joins,
#                 j.value:sql_foreign_key::varchar as sql_foreign_key,
#                 j.value:sql_on::varchar as sql_on,
#                 j.value:sql_table_name::varchar as sql_table_name,
#                 j.value:sql_where::varchar as sql_where,
#                 j.value:type::varchar as type,
#                 j.value:view_label::varchar as view_label
#         from lookml.models m
#         , lateral flatten(input => m.explores) ex
#         , lateral flatten(input => ex.value:joins) j
#          ;;

  dimension: joins_pk {
    label: "Joins PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${name} ;;
    hidden: yes
  }

  dimension: fields {
    label: "Fields JSON"
    type: string
    sql: j.value:fields::variant ;;
    hidden: yes
  }

  dimension: foreign_key {
    label: "Foreign Key"
    type: string
    sql: j.value:foreign_key::varchar ;;
  }

  dimension: from {
    label: "From"
    type: string
    sql: j.value:from::varchar ;;
  }

  dimension: name {
    label: "Join Name"
    type: string
    sql: j.value:name::varchar ;;
  }

  dimension: outer_only {
    label: "Outer Only"
    type: string
    sql: j.value:outer_only::varchar ;;
  }

  dimension: outer_only_yn {
    group_label: "YesNo"
    label: "Outer Only"
    type: string
    sql: ${outer_only} = 'yes' ;;
  }

  dimension: relationship {
    label: "Relationship"
    type: string
    sql: j.value:relationship::varchar ;;
  }

  dimension: required_access_grants {
    label: "Required Access Grants List"
    type: string
    sql: j.value:required_access_grants::variant ;;
    hidden: yes
  }

  dimension: required_joins {
    label: "Required Joins List"
    type: string
    sql: j.value:required_joins::variant ;;
    hidden: yes
  }

  dimension: sql_foreign_key {
    label: "SQL Foreign Key"
    type: string
    sql: j.value:sql_foreign_key::varchar ;;
  }

  dimension: sql_on {
    label: "SQL On"
    type: string
    sql: j.value:sql_on::varchar ;;
  }

  dimension: sql_table_name {
    label: "SQL Table Name"
    type: string
    sql: j.value:sql_table_name::varchar ;;
  }

  dimension: sql_where {
    label: "SQL Where"
    type: string
    sql: j.value:sql_where::varchar ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: j.value:type::varchar ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: j.value:view_label::varchar ;;
  }

  measure: count {
    label: "Number of Joins"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      name,
      type,
      from,
      relationship,
      view_label,
      foreign_key,
      sql_on,
      sql_foreign_key,
      sql_where
    ]
  }

}
