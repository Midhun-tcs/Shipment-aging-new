connection: "lok_db_obi"

# include all the views
include: "/views/**/*.view"

datagroup: new_shipment_aging_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: new_shipment_aging_default_datagroup

explore: location {}

explore: shipment_aging_detail {
  join: location {
    type: left_outer
    sql_on: ${shipment_aging_detail.curr_loc_fk}=${location.locn_sk} ;;
    relationship: many_to_one
  }
}
