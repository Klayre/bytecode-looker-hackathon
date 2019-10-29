view: permission_sets__permissions {
  view_label: "Permission Sets"
  derived_table: {
    sql: select  ps.id as permission_set_id,
                  ps.name as permission_set_name,
                  ps.permissions::variant as permissions,
                  psp.value::varchar as permission
          from looker.permission_sets ps
          , lateral flatten(input => ps.permissions) psp ;;
  }
  dimension: permissions_pk {
    label: "Permissions PK"
    type: string
    primary_key: yes
    sql: ${permission_set_id} || '-' || ${permission} ;;
    hidden: yes
  }

  dimension: permission_set_id {
    label: "Permission Set ID"
    type: string
    sql: ${TABLE}.permission_set_id ;;
    hidden: yes
  }

  dimension: permission {
    group_label: "Permissions"
    label: "Permission"
    type: string
    sql: ${TABLE}.permission ;;
  }


  set: detail {
    fields: [
      permission_sets.id,
      permission_sets.name,
      permission
    ]
  }
}
