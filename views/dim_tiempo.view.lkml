view: dim_tiempo {
  sql_table_name: `output.DIM_TIEMPO` ;;

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }
  dimension: ultimos_12_meses {
    hidden: yes
    sql: ${TABLE}.ultimos_12_meses ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}

view: dim_tiempo__ultimos_12_meses {

  dimension_group: dim_tiempo__ultimos_12_meses {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: dim_tiempo__ultimos_12_meses ;;
  }
}
