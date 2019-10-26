view: model_sets__models {
  view_label: "Roles"
#   sql: select  ms.id,
#                 ms.name,
#                 ms.models::variant as models,
#                 msm.value::varchar as model
#         from looker.model_sets ms
#         , lateral flatten(input => ms.models) msm ;;

  dimension: models_pk {
    group_label: "Model Sets"
    label: "Models PK"
    type: string
    primary_key: yes
    sql: ${model_sets.id} || '-' || ${model} ;;
    hidden: yes
  }

  dimension: model {
    group_label: "Model Sets"
    label: "Model"
    type: string
    sql: msm.value::varchar ;;
  }


  set: detail {
    fields: [
      model_sets.id,
      model_sets.name,
      model
    ]
  }
}
