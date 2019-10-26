view: explores__aliases {
  view_label: "Explores"
    # sql: select  ex.id,
    #               ex.name,
    #               ex.aliases::variant as aliases,
    #               als.value:name::varchar as alias_name,
    #               als.value:value::varchar as alias_value
    #       from looker.explores ex
    #       , lateral flatten(input => ex.aliases) als ;;

  dimension: alias_pk {
    group_label: "Aliases"
    label: "Alias PK"
    type: string
    primary_key: yes
    sql: ${explores.id} || '-' || ${alias_name}  || '-' || ${alias_value}  ;;
    hidden: yes
  }

  dimension: alias_name {
    group_label: "Aliases"
    label: "Alias Name"
    type: string
    sql: als.value:name::varchar ;;
  }

  dimension: alias_value {
    group_label: "Aliases"
    label: "Alias Value"
    type: string
    sql: als.value:value::varchar ;;
  }

  measure: count {
    label: "Number of Aliases"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      explores.id,
      explores.name,
      alias_name,
      alias_value
    ]
  }
}
