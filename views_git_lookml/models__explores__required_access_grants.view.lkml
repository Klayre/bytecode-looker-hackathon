view: models__explores__required_access_grants {
  view_label: "Explores: Required Access Grants"
  # sql:    select  m.sha as model_sha,
  #                 m.path as model_path,
  #                 ex.value:name::varchar as explore_name,
  #                 ex.value:required_access_grants::variant as required_access_grants,
  #                 rag.value::varchar as access_grant
  #         from lookml.models m
  #         , lateral flatten(input => m.explores) ex
  #         , lateral flatten(input => ex.value:required_access_grants) rag ;;

  dimension: required_access_grants_pk {
    label: "Required Access Grants PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${access_grant} ;;
    hidden: yes
  }

  dimension: access_grant {
    label: "Access Grant"
    type: string
    sql: rag.value::varchar ;;
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
      access_grant
    ]
  }

}
