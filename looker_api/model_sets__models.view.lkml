view: model_sets__models {
  view_label: "Model Sets"
  derived_table: {
    sql: select  ms.id as model_set_id,
                  ms.name as model_set_name,
                  ms.models::variant as models,
                  msm.value::varchar as model
          from looker.model_sets ms
          , lateral flatten(input => ms.models) msm ;;
  }

  dimension: models_pk {
    label: "Models PK"
    type: string
    primary_key: yes
    sql: ${model_set_id} || '-' || ${model} ;;
    hidden: yes
  }

  dimension: model_set_id {
    label: "Model Set ID"
    type: string
    sql: ${TABLE}.model_set_id ;;
    hidden: yes
  }

  dimension: model {
    label: "Model"
    type: string
    sql: ${TABLE}.model ;;
  }


  set: detail {
    fields: [
      model_sets.id,
      model_sets.name,
      model
    ]
  }
}
