view: models__explores__joins__required_access_grants {
  view_label: "Joins"
  derived_table: {
    sql:  select  m.sha as model_sha,
                  m.path as model_path,
                  m.git_owner as git_owner,
                  m.git_repository as git_repository,
                  split_part(split_part(m.path, '.', -3), '/', -1) as model_name,
                  ex.value as explore,
                  ex.value:name::varchar as explore_name,
                  ex.value:joins::variant as joins_json,
                  j.value:name::varchar as join_name,
                  j.value:required_access_grants::variant as required_access_grants,
                  jrag.value::varchar as access_grant
          from lookml.models m
          , lateral flatten(input => m.explores) ex
          , lateral flatten(input => ex.value:joins) j
          , lateral flatten(input => j.value:required_access_grants) jrag ;;
  }

  dimension: required_access_grants_pk {
    group_label: "Required Access Grants"
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${join_key} || '-' || ${access_grant} ;;
    hidden: yes
  }

  dimension: join_key {
    group_label: "Keys/IDs"
    label: "Joins PK"
    type: string
    sql: ${explore_id} || '::' || ${join_name} ;;
    hidden: yes
  }

  dimension: join_name {
    group_label: "Keys/IDs"
    label: "Join Name"
    type: string
    sql: ${TABLE}.join_name ;;
    hidden: yes
  }

  dimension: explore_id {
    group_label: "Keys/IDs"
    label: "Explore ID"
    type: string
    sql: ${model_name}  || '::' || ${explore_name} ;;
    hidden: yes
  }

  dimension: explore_name {
    group_label: "Keys/IDs"
    label: "Explore ID"
    type: string
    sql: ${TABLE}.explore_name ;;
    hidden: yes
  }

  dimension: model_name {
    group_label: "Keys/IDs"
    label: "Model Name"
    type: string
    sql: ${TABLE}.model_name ;;
    hidden: yes
  }

  dimension: access_grant {
    group_label: "Required Access Grants"
    label: "Access Grant"
    type: string
    sql: ${TABLE}.access_grant ;;
  }

  measure: count {
    label: "Number of Join Required Access Grants"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_name,
      explore_name,
      join_name,
      access_grant
    ]
  }

}
