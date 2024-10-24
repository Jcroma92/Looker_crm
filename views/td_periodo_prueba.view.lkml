view: td_periodo_prueba {
  sql_table_name: `output.TD_PERIODO_PRUEBA` ;;

  dimension: desc_per_prba {
    type: string
    sql: ${TABLE}.DESC_PER_PRBA ;;
  }
  dimension: sit_def_per_prba {
    type: string
    sql: ${TABLE}.SIT_DEF_PER_PRBA ;;
  }
  measure: count {
    type: count
  }
}
