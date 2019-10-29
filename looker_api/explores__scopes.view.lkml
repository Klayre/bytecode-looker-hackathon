view: explores__scopes {
  view_label: "Explores"
  derived_table: {
    sql: select  ex.id as explore_id,
                  ex.name as explore_name,
                  ex.scopes::variant as scopes,
                  scp.value::varchar as scope
          from looker.explores ex
          , lateral flatten(input => ex.scopes) scp ;;
  }

  dimension: scopes_pk {
    group_label: "Scopes"
    label: "Scopes PK"
    type: string
    primary_key: yes
    sql: ${explore_id} || '-' || ${scope} ;;
    hidden: yes
  }

  dimension: explore_id {
    group_label: "Scopes"
    label: "Explore ID"
    type: string
    sql: ${TABLE}.explore_id ;;
    hidden: yes
  }

  dimension: scope {
    group_label: "Scopes"
    label: "Scope"
    type: string
    sql: ${TABLE}.scope ;;
  }


  set: detail {
    fields: [
      explores.id,
      explores.name,
      scope
    ]
  }
}
