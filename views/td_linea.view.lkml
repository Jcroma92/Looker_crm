view: td_linea {
  sql_table_name: `output.TD_LINEA` ;;

  dimension: cod_linea {
    type: string
    sql: ${TABLE}.COD_LINEA ;;
  }
  dimension: desc_linea {
    type: string
    sql: ${TABLE}.DESC_LINEA ;;
  }
  measure: count {
    type: count
  }
}
