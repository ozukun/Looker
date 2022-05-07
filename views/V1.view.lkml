view: v1 {
  # # You can specify the table name if it's different from the view name:
  derived_table: {
    sql:
     select distinct
distribution_center_id,CATEGORY,
avg(cost) over ( partition by distribution_center_id) as avg_cost_dist,
avg(cost) over ( partition by CATEGORY) as avg_cost_category
from
`cloud-training-demos.looker_ecomm.products`
;;
  }


  #
  # # Define your dimensions and measures here, like this:
  dimension: user_id {
    description: "ID1"
    type: number
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: CATEGORY {
    description: "brand"
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }


  dimension: avg_cost_dist {
    description: "VALUE"
    type: number
    sql: ${TABLE}.avg_cost_dist;;
  }
  dimension: avg_cost_category {
    description: "VALUE"
    type: number
    sql: ${TABLE}.avg_cost_category;;
  }

  measure: avg_cost_dist_final {
    description: "VALUE"
    type: max
    sql: ${avg_cost_dist};;
  }
  measure: avg_cost_category_final {
    description: "VALUE"
    type: max
    sql: ${avg_cost_category};;
  }

  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: v1 {
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
