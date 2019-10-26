view: permission_sets__permissions {
  view_label: "Roles"
#   sql: select  ps.id,
#                 ps.name,
#                 ps.permissions::variant as permissions,
#                 psp.value::varchar as permission
#         from looker.permission_sets ps
#         , lateral flatten(input => ps.permissions) psp ;;

  dimension: permissions_pk {
    group_label: "Permission Sets"
    label: "Permissions PK"
    type: string
    primary_key: yes
    sql: ${permission_sets.id} || '-' || ${permission} ;;
    hidden: yes
  }

  dimension: permission {
    group_label: "Permission Sets"
    label: "Permission"
    type: string
    sql: psp.value::varchar ;;
  }


  set: detail {
    fields: [
      permission_sets.id,
      permission_sets.name,
      permission
    ]
  }
}
