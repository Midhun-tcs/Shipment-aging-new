view: shipment_aging_detail {
  sql_table_name: Looker_Dashboard.Shipment_Aging_Detail ;;

  dimension: add_by_appl_cd {
    type: string
    sql: ${TABLE}.add_by_appl_cd ;;
  }

  dimension_group: bops_actl_pickup_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.bops_actl_pickup_ts ;;
  }

  dimension: bops_ind {
    type: yesno
    sql: ${TABLE}.bops_ind ;;
  }

  dimension_group: bops_rdy_actl_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.bops_rdy_actl_ts ;;
  }

  dimension_group: bops_rdy_trgt_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.bops_rdy_trgt_ts ;;
  }

  dimension: bops_stat_cd {
    type: string
    sql: ${TABLE}.bops_stat_cd ;;
  }

  dimension: bops_stat_desc {
    type: string
    sql: ${TABLE}.bops_stat_desc ;;
  }

  dimension_group: boss_delvr_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.boss_delvr_ts ;;
  }

  dimension: boss_ind {
    type: yesno
    sql: ${TABLE}.boss_ind ;;
  }

  dimension: clr_desc {
    type: string
    sql: ${TABLE}.clr_desc ;;
  }

  dimension: cost_of_shp_amt {
    type: number
    sql: ${TABLE}.cost_of_shp_amt ;;
  }

  dimension: cost_of_unit_amt {
    type: number
    sql: ${TABLE}.cost_of_unit_amt ;;
  }

  dimension: curr_loc_fk {
    type: number
    sql: ${TABLE}.curr_loc_fk ;;
  }

  dimension: cust_frst_nm {
    type: string
    sql: ${TABLE}.cust_frst_nm ;;
  }

  dimension: cust_lst_nm {
    type: string
    sql: ${TABLE}.cust_lst_nm ;;
  }

  dimension: delvr_carr_desc {
    type: string
    sql: ${TABLE}.delvr_carr_desc ;;
  }

  dimension: delvr_carr_srvc_desc {
    type: string
    sql: ${TABLE}.delvr_carr_srvc_desc ;;
  }

  dimension: delvr_catgry_cd {
    type: string
    sql: ${TABLE}.delvr_catgry_cd ;;
  }

  dimension: delvr_mthd_desc {
    type: string
    sql: ${TABLE}.delvr_mthd_desc ;;
  }

  dimension: delvr_stat_desc {
    type: string
    sql: ${TABLE}.delvr_stat_desc ;;
  }

  dimension: delvr_sub_typ_desc {
    type: string
    sql: ${TABLE}.delvr_sub_typ_desc ;;
  }

  dimension: delvr_typ_desc {
    type: string
    sql: ${TABLE}.delvr_typ_desc ;;
  }

  dimension: due_type_desc {
    type: string
    sql: ${TABLE}.due_type_desc ;;
  }

  dimension_group: esmt_delvr_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.esmt_delvr_ts ;;
  }

  dimension: fill_loc_fk {
    type: number
    primary_key: yes
    sql: ${TABLE}.fill_loc_fk ;;
  }

  dimension_group: flg_lost_miss_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.flg_lost_miss_ts ;;
  }

  dimension: fw_fj_ind {
    type: yesno
    sql: ${TABLE}.fw_fj_ind ;;
  }

  dimension: pickup_loc_fk {
    type: number
    sql: ${TABLE}.pickup_loc_fk ;;
  }

  dimension: resv_nbr {
    type: number
    sql: ${TABLE}.resv_nbr ;;
  }

  dimension: sell_loc_fk {
    type: number
    sql: ${TABLE}.sell_loc_fk ;;
  }

  dimension: shpabl_ind {
    type: yesno
    sql: ${TABLE}.shpabl_ind ;;
  }

  dimension_group: shpmnt_by_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shpmnt_by_ts ;;
  }

  dimension_group: shpmnt_cnfrm_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shpmnt_cnfrm_ts ;;
  }

  dimension: unit_qty {
    type: number
    sql: ${TABLE}.unit_qty ;;
  }

  measure: unit {
    type: sum
    sql: ${unit_qty} ;;
    drill_fields: [location.Division,location.Region,location.District,location.Store,resv_nbr,unit]
  }
  measure: avg_unit {
    type: average
    sql: ${unit_qty} ;;
    drill_fields: [location.Division,location.Region,location.District,location.Store,resv_nbr,unit]
  }
  measure: unit_date {
    type: sum
    sql: ${unit_qty} ;;
    drill_fields: [location.Division,location.Region,location.District,location.Store,shpmnt_by_ts_date,unit]
  }
  measure: cost_of_unit {
    type: sum
    sql: ${cost_of_unit_amt} ;;
    drill_fields: [location.Division,location.Region,location.District,location.Store,resv_nbr,cost_of_unit]
  }
  dimension: on_tim {
    type: number
    sql:case when ${boss_delvr_ts_date}<${esmt_delvr_ts_date} then 1 else 0 end ;;
  }
  measure: on_time {
    type: count_distinct
    sql:case when ${on_tim}=1 then 1 else 0 end ;;
    drill_fields: [resv_nbr]
  }
}
