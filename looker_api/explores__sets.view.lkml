view: explores__sets {
  view_label: "Explores"
#   sql:  select  ex.id,
#                 ex.name,
#                 ex.sets::variant as sets,
#                 "set".value::variant as "set",
#                 "set".value:name::varchar as set_name,
#                 "set".value:value::variant as field_list,
#                 setfld.value::varchar as field_name
#         from looker.explores ex
#         , lateral flatten(input => ex.sets) "set"
#         , lateral flatten(input => "set".value:value) setfld ;;

  dimension: sets_pk {
    group_label: "Sets"
    label: "Sets PK"
    type: string
    primary_key: yes
    sql: ${explores.id} || '-' || ${set_name} || '-' || ${field_name} ;;
    hidden: yes
  }

  dimension: sets_key {
    group_label: "Sets"
    label: "Sets Key"
    type: string
    sql: ${explores.id} || '-' || ${set_name} ;;
    hidden: yes
  }

  dimension: set_name {
    group_label: "Sets"
    label: "Set Name"
    type: string
    sql: "set".value:name::varchar ;;
  }

  dimension: field_name {
    group_label: "Sets"
    label: "Field Name"
    type: string
    sql: setfld.value::varchar ;;
  }

  measure: count {
    label: "Number of Set Fields"
    type: count
  }

  measure: count_sets {
    label: "Number of Sets"
    type: count_distinct
    sql: ${sets_key} ;;
  }


  set: detail {
    fields: [
      explores.id,
      explores.name,
      set_name,
      field_name
    ]
  }
}
