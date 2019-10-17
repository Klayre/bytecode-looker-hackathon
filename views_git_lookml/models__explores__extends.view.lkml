view: models__explores__extends {
  view_label: "Explores: Extends"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   ex.value:name::varchar as explore_name,
#                   ext.value::varchar as extends_explore_name
#           from lookml.models m
#           , lateral flatten(input => m.explores) ex
#           , lateral flatten(input => ex.value:extends) ext ;;

  dimension: extends_pk {
    label: "Extends PK"
    type: string
    primary_key: yes
    sql: ${models__explores.explores_pk} || '-' || ${extends_explore_name} ;;
    hidden: yes
  }

  dimension: extends_explore_name {
    label: "Extends Explore Name"
    type: string
    sql: ext.value::varchar as extends_explore_name ;;
  }

  measure: count {
    label: "Number of Extends"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      extends_explore_name
    ]
  }

}
