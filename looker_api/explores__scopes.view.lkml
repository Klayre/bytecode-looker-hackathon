view: explores__scopes {
  view_label: "Explores"
#   sql: select  ex.id,
#                 ex.name,
#                 ex.scopes::variant as aliases,
#                 scp.value::varchar as scope
#         from looker.explores ex
#         , lateral flatten(input => ex.scopes) scp ;;

  dimension: scopes_pk {
    group_label: "Scopes"
    label: "Scopes PK"
    type: string
    primary_key: yes
    sql: ${explores.id} || '-' || ${scope} ;;
    hidden: yes
  }

  dimension: scope {
    group_label: "Scopes"
    label: "Scope"
    type: string
    sql: scp.value::varchar ;;
  }


  set: detail {
    fields: [
      explores.id,
      explores.name,
      scope
    ]
  }
}
