view: models__explores__joins__required_access_grants {
  view_label: "Joins: Required Access Grants"
    # sql: select  m.sha as model_sha,
    #               m.path as model_path,
    #               ex.value:name::varchar as explore_name,
    #               ex.value:joins::variant as joins_json,
    #               j.value:name::varchar as join_name,
    #               j.value:required_access_grants::variant as required_access_grants,
    #               jrag.value::varchar as access_grant
    #       from lookml.models m
    #       , lateral flatten(input => m.explores) ex
    #       , lateral flatten(input => ex.value:joins) j
    #       , lateral flatten(input => j.value:required_access_grants) jrag ;;

  dimension: required_access_grants_pk {
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${models__explores__joins.joins_pk} || '-' || ${access_grant} ;;
    hidden: yes
  }

  dimension: access_grant {
    label: "Access Grant"
    type: string
    sql: jrag.value::varchar ;;
  }

  measure: count {
    label: "Number of Required Access Grants"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      models__explores__joins.name,
      access_grant
    ]
  }

}
