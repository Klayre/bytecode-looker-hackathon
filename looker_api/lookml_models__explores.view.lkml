view: lookml_models__explores {
  view_label: "LookML Models"
  derived_table: {
    sql: select  lm.name as model_name,
                  e.value::varchar as explore,
                  e.value:group_label::varchar as group_label,
                  e.value:hidden::boolean as hidden,
                  e.value:label::varchar as label,
                  e.value:name::varchar as name
          from looker.lookml_models lm
          , lateral flatten(input => lm.explores) e ;;
  }

  dimension: explore_id {
    group_label: "Explores"
    label: "Explore ID"
    type: string
    primary_key: yes
    sql: ${model_name} || '::' || ${explore_name} ;;
  }

  dimension: model_name {
    group_label: "Explores"
    label: "Model Name"
    type: string
    sql: ${TABLE}.model_name ;;
    hidden: yes
  }

  dimension: group_label {
    group_label: "Explores"
    label: "Group Label"
    type: string
    sql: ${TABLE}.group_label ;;
  }

  dimension: hidden {
    group_label: "Explores"
    label: "Hidden"
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension: explore_name {
    group_label: "Explores"
    label: "Explore Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: label {
    group_label: "Explores"
    label: "Explore Label"
    type: string
    sql: ${TABLE}.label ;;
  }


  set: detail {
    fields: [
      model_name,
      explore_name,
      label,
      group_label,
      hidden
    ]
  }
}
