view: users__roles {
    view_label: "Users"
    derived_table: {
     sql: select  u.id,
                  u.role_ids::variant as role_ids,
                  ur.value::varchar as role_id
          from looker.users u
          , lateral flatten(input => u.role_ids) ur ;;
    }

    dimension: roles_pk {
      group_label: "Roles"
      label: "Roles PK"
      type: string
      primary_key: yes
      sql: ${user_id} || '-' || ${role_id} ;;
      hidden: yes
    }

    dimension: user_id {
      group_label: "Roles"
      label: "User ID"
      type: string
      sql: ${TABLE}.user_id;;
      hidden: yes
    }

    dimension: role_id {
      group_label: "Roles"
      label: "Role ID"
      type: string
      sql: ${TABLE}.role_id ;;
    }

    set: detail {
      fields: [
        users.id,
        role_id
      ]
    }
  }
