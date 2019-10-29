view: lookml_models__connections {
  view_label: "LookML Models"
  derived_table: {
    sql: select  lm.name as model_name,
                  lm.allowed_db_connection_names as connections,
                  c.value::varchar as "connection"
          from looker.lookml_models lm
          , lateral flatten(input => lm.allowed_db_connection_names) c ;;
  }

  dimension: model_connections_pk {
    group_label: "Connections"
    label: "Model Connections PK"
    type: string
    primary_key: yes
    sql: ${model_name} || '-' || ${connection} ;;
    hidden: yes
  }

  dimension: model_name {
    group_label: "Connections"
    label: "Model Name"
    type: string
    sql: ${TABLE}.model_name ;;
    hidden: yes
  }

  dimension: connection {
    group_label: "Connections"
    label: "Connection"
    type: string
    sql: ${TABLE}."connection" ;;
  }


  set: detail {
    fields: [
      model_name,
      connection
    ]
  }
}
