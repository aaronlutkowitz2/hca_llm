view: llm_or_dataset {
  sql_table_name: `llm.llm_or_dataset`
    ;;

  dimension: beds_filled {
    type: number
    sql: ${TABLE}.beds_filled ;;
  }

  dimension: beds_total {
    type: number
    sql: ${TABLE}.beds_total ;;
  }

  dimension: coid {
    type: number
    value_format_name: id
    sql: ${TABLE}.coid ;;
  }

  dimension: coid_name {
    type: string
    sql: ${TABLE}.coid_name ;;
  }

  dimension: division_name {
    type: string
    sql: ${TABLE}.Division_Name ;;
  }

  dimension: ed_volume_estimate {
    type: number
    sql: ${TABLE}.ed_volume_estimate ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: market_name {
    type: string
    sql: ${TABLE}.market_name ;;
  }

  dimension: division_name_lower {
    type: string
    sql: lower(${division_name}) ;;
  }

  dimension: group_name_lower {
    type: string
    sql: lower(${group_name}) ;;
  }

  dimension: market_name_lower {
    type: string
    sql: lower(${market_name}) ;;
  }

  dimension: coid_name_lower {
    type: string
    sql: lower(${coid_name}) ;;
  }

  dimension: staff_actual {
    type: number
    sql: ${TABLE}.staff_actual ;;
  }

  dimension: staff_target {
    type: number
    sql: ${TABLE}.staff_target ;;
  }

  measure: count {
    type: count
    drill_fields: [group_name, coid_name, division_name, market_name]
  }

  measure: sum_beds_filled {
    type: sum
    sql: ${beds_filled} ;;
  }

  measure: sum_beds_total {
    type: sum
    sql: ${beds_total} ;;
  }

  measure: percent_beds_filled {
    type: number
    sql: ${sum_beds_filled} / nullif(${sum_beds_total},0) ;;
    value_format_name: percent_1
  }

  measure: sum_staff_actual {
    type: sum
    sql: ${staff_actual} ;;
  }

  measure: sum_staff_target {
    type: sum
    sql: ${staff_target} ;;
  }

  measure: percent_headcount_filled {
    type: number
    sql: ${sum_staff_actual} / nullif(${sum_staff_target},0) ;;
    value_format_name: percent_1
  }

  measure: estimated_ed_volume {
    type: sum
    sql: ${ed_volume_estimate} ;;
  }
}
