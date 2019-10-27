view: models__explores__joins {
  view_label: "Joins"
  derived_table: {
    sql: select m.sha as model_sha,
                m.path as model_path,
                m.git_owner as git_owner,
                m.git_repository as git_repository,
                split_part(split_part(m.path, '.', -3), '/', -1) as model_name,
                ex.value as explore,
                ex.value:name::varchar as explore_name,
                ex.value:joins::variant as joins_json,
                j.value:fields::variant as fields,
                j.value:foreign_key::varchar as foreign_key,
                j.value:"from"::varchar as "from",
                j.value:name::varchar as name,
                j.value:outer_only::varchar as outer_only,
                j.value:relationship::varchar as relationship,
                j.value:required_access_grants::variant as required_access_grants,
                j.value:required_joins::variant as required_joins,
                j.value:sql_foreign_key::varchar as sql_foreign_key,
                j.value:sql_on::varchar as sql_on,
                j.value:sql_table_name::varchar as sql_table_name,
                j.value:sql_where::varchar as sql_where,
                j.value:"type"::varchar as "type",
                j.value:view_label::varchar as view_label
        from lookml.models m
        , lateral flatten(input => m.explores) ex
        , lateral flatten(input => ex.value:joins) j ;;
  }

  filter: names_metasearch {
    type: string
    suggestable: no
    case_sensitive: no
    sql:
    {% condition %} ${name} {% endcondition %}
    OR
    {% condition %} ${from} {% endcondition %}
    OR
    {% condition %} ${models__explores.name} {% endcondition %}
    OR
    {% condition %} ${models__explores.extends_list} {% endcondition %}
    OR
    {% condition %} ${models__explores.from} {% endcondition %}
    OR
    {% condition %} ${models__explores.view_name} {% endcondition %}
    OR
    {% condition %} ${model_files.name} {% endcondition %}
    OR
    {% condition %} ${model_files.git_owner} {% endcondition %}
    OR
    {% condition %} ${model_files.git_repository} {% endcondition %}

    ;;
  }

  dimension: joins_pk {
    group_label: "Keys/IDs"
    label: "Joins PK"
    type: string
    primary_key: yes
    sql: ${explore_id} || '::' || ${name} ;;
    hidden: yes
  }

  dimension: explore_id {
    group_label: "Keys/IDs"
    label: "Explore ID"
    type: string
    sql: ${model_name}  || '::' || ${explore_name} ;;
  }

  dimension: explore_name {
    group_label: "Keys/IDs"
    label: "Explore ID"
    type: string
    sql: ${TABLE}.explore_name ;;
  }

  dimension: model_name {
    group_label: "Keys/IDs"
    label: "Model Name"
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: model_sha {
    group_label: "Keys/IDs"
    label: "Model SHA"
    type: string
    sql: ${TABLE}.model_sha ;;
  }

  dimension: model_path {
    group_label: "Keys/IDs"
    label: "Model Path"
    type: string
    sql: ${TABLE}.model_path ;;
  }

  dimension: git_owner {
    group_label: "Keys/IDs"
    label: "Git Owner"
    type: string
    sql: ${TABLE}.GIT_OWNER ;;
  }

  dimension: git_repository {
    group_label: "Keys/IDs"
    label: "Git Repository"
    type: string
    sql: ${TABLE}.GIT_REPOSITORY ;;
  }

  dimension: model_key {
    label: "Model Key"
    type: string
    hidden: yes
    sql: ${git_owner} || '-' || ${git_repository} || '-' || ${model_path} ;;
  }


  dimension: fields {
    group_label: "Fields"
    label: "Fields JSON"
    type: string
    sql: ${TABLE}.fields ;;
    hidden: yes
  }

  dimension: fields_list {
    group_label: "Fields"
    label: "Fields List"
    type: string
    sql:array_to_string(parse_json(${fields}), ', ') ;;
  }

  dimension: foreign_key {
    label: "Foreign Key"
    type: string
    sql: ${TABLE}.foreign_key ;;
  }

  dimension: from {
    label: "From"
    type: string
    sql: ${TABLE}."from" ;;
  }

  dimension: join_view_name {
    label: "Join View Name"
    type: string
    sql: COALESCE(${from}, ${name}) ;;
  }

  dimension: name {
    label: "Join Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: outer_only {
    label: "Outer Only"
    type: string
    sql: ${TABLE}.outer_only ;;
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
    sql: ${TABLE}.relationship ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants JSON"
    type: string
    sql: ${TABLE}.required_access_grants ;;
    hidden: yes
  }

  dimension: required_access_grants_list {
    group_label: "Required Access Grants"
    label: "Required Access Grants List"
    type: string
    sql:array_to_string(parse_json(${required_access_grants}), ', ') ;;
  }

  dimension: required_joins {
    group_label: "Required Joins"
    label: "Required Joins"
    type: string
    sql: ${TABLE}.required_joins ;;
    hidden: yes
  }

  dimension: required_joins_list {
    group_label: "Required Joins"
    label: "Required Joins List"
    type: string
    sql:array_to_string(parse_json(${required_joins}), ', ') ;;
  }

  dimension: sql_foreign_key {
    group_label: "SQL"
    label: "SQL Foreign Key"
    type: string
    sql: ${TABLE}.sql_foreign_key ;;
  }

  dimension: sql_on {
    group_label: "SQL"
    label: "SQL On"
    type: string
    sql: ${TABLE}.sql_on ;;
  }

  dimension: sql_table_name {
    group_label: "SQL"
    label: "SQL Table Name"
    type: string
    sql: ${TABLE}.sql_table_name ;;
  }

  dimension: sql_where {
    group_label: "SQL"
    label: "SQL Where"
    type: string
    sql: ${TABLE}.sql_where ;;
  }

  dimension: type {
    label: "Type"
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql:  ${TABLE}.view_label ;;
  }

  measure: count {
    label: "Number of Joins"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_name,
      explore_name,
      name,
      type,
      from,
      relationship,
      view_label,
      foreign_key,
      sql_table_name,
      sql_on,
      sql_foreign_key,
      sql_where
    ]
  }

}
