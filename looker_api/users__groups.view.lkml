view: users__groups {
  view_label: "Users"
#    sql: select  u.id,
#                 u.group_ids::variant as group_ids,
#                 ug.value::varchar as group_id
#         from looker.users u
#         , lateral flatten(input => u.group_ids) ug ;;

  dimension: groups_pk {
    group_label: "Groups"
    label: "Groups PK"
    type: string
    primary_key: yes
    sql: ${users.id} || '-' || ${group_id} ;;
    hidden: yes
  }

  dimension: group_id {
    group_label: "Groups"
    label: "Group ID"
    type: string
    sql: ug.value::varchar ;;
  }


  set: detail {
    fields: [
      users.id,
      group_id
    ]
  }
}

# view: users__groups {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
