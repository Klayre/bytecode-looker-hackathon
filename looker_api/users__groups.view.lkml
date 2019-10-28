view: users__groups {
  view_label: "Users"
  derived_table: {
   sql: select  u.id as user_id,
                u.group_ids::variant as group_ids,
                ug.value::varchar as group_id
        from looker.users u
        , lateral flatten(input => u.group_ids) ug ;;
  }

  dimension: groups_pk {
    group_label: "Groups"
    label: "Groups PK"
    type: string
    primary_key: yes
    sql: ${user_id} || '-' || ${group_id} ;;
    hidden: yes
  }

  dimension: user_id {
    group_label: "Groups"
    label: "User ID"
    type: string
    sql: ${TABLE}.user_id;;
    hidden: yes
  }

  dimension: group_id {
    group_label: "Groups"
    label: "Group ID"
    type: string
    sql: ${TABLE}.group_id ;;
  }


  set: detail {
    fields: [
      users.id,
      group_id
    ]
  }
}
