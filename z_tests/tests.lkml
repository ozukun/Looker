test: order_items_explore {
  explore_source: order_items {
    column: count_of_items { field: order_items.count_of_ordered_items }
    column: count_of_users { field: users.count }
    column: count_of_inventory { field: inventory_items.count }
    column: count_of_centers { field: distribution_centers.count }
  }
  assert: order_items_has_data {
    expression: ${order_items.count_of_ordered_items} > 0 ;;
  }
  assert: users_has_data {
    expression: ${users.count} > 0 ;;
  }
  assert: inventory_has_data {
    expression: ${inventory_items.count} > 0 ;;
  }
  assert: distribution_has_data {
    expression: ${distribution_centers.count} > 0 ;;
  }
}

test: events_explore {
  explore_source: events {
    column: count {}
    column: session_landing_page { field: event_session_facts.session_landing_page }
    column: count_sessions { field: event_session_funnel.count_sessions }
  }
  assert: events_has_data {
    expression: ${events.count} > 0 ;;
  }
  assert: event_facts_has_data {
    expression: count(${event_session_facts.session_landing_page}) = 7 ;;
  }
  assert: event_funnel_has_data {
    expression: ${event_session_funnel.count_sessions} > 0 ;;
  }
}
