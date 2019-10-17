view: models__explores__fields {
  view_label: "Explores: Fields"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ex.value:name::varchar as explore_name,
#                   f.value::varchar as field_or_set_name
#           from lookml.models m
#           , lateral flatten(input => m.explores) ex
#           , lateral flatten(input => ex.value:fields) f ;;

  dimension: fields_pk {
    label: "Fields PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${field_or_set_name} ;;
    hidden: yes
  }


  dimension: field_name {
    label: "Field Name"
    type: string
    sql: CASE WHEN CONTAINS(${field_or_set_name}, '*') THEN NULL
      ELSE REPLACE(REPLACE(${field_or_set_name}, '-'), '*') END  ;;
  }

  dimension: field_or_set_name {
    label: "Field or Set Name"
    type: string
    sql: f.value::varchar as field_or_set_name ;;
  }

  dimension: fields_type {
    label: "Fields Type"
    type: string
    sql: CASE WHEN CONTAINS(${field_or_set_name}, '*') THEN 'set'
          ELSE 'field' END ;;
  }

  dimension: is_exclusion {
    label: "Is Exclusion"
    type: yesno
    sql: LEFT(${field_or_set_name}, 1) = '-' ;;
  }

  dimension: set_name {
    label: "Set Name"
    type: string
    sql:  CASE WHEN CONTAINS(${field_or_set_name}, '*') THEN
            REPLACE(REPLACE(${field_or_set_name}, '-'), '*')
          ELSE NULL END  ;;
  }

  measure: count {
    label: "Number of Fields"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      field_or_set_name,
      field_name,
      set_name,
      is_exclusion
    ]
  }

}
