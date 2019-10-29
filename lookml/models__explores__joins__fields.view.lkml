view: models__explores__joins__fields {
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
                  j.value:fields::variant as fields_json,
                  jf.value::varchar as field_or_set_name
          from lookml.models m
          , lateral flatten(input => m.explores) ex
          , lateral flatten(input => ex.value:joins) j
          , lateral flatten(input => j.value:fields) jf ;;
  }

  dimension: fields_pk {
    group_label: "Fields"
    label: "Fields PK"
    type: string
    primary_key: yes
    sql: ${join_key}  || '-' || ${field_or_set_name} ;;
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

  dimension: field_name {
    group_label: "Fields"
    label: "Field Name"
    type: string
    sql: CASE WHEN CONTAINS(${field_or_set_name}, '*') THEN NULL
      ELSE REPLACE(${field_or_set_name}, '*') END  ;;
  }

  dimension: field_or_set_name {
    group_label: "Fields"
    label: "Field or Set Name"
    type: string
    sql: jf.value::varchar ;;
  }

  dimension: fields_type {
    group_label: "Fields"
    label: "Fields Type"
    type: string
    sql: CASE WHEN CONTAINS(${field_or_set_name}, '*') THEN 'set'
      ELSE 'field' END ;;
  }

  dimension: set_name {
    group_label: "Fields"
    label: "Set Name"
    type: string
    sql:  CASE WHEN CONTAINS(${field_or_set_name}, '*') THEN
            REPLACE(REPLACE(${field_or_set_name}, '-'), '*')
          ELSE NULL END  ;;
  }

  measure: count {
    label: "Number of Join Field Entries"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_name,
      explore_name,
      join_name,
      field_or_set_name,
      field_name,
      set_name
    ]
  }

}
