view: td_producto {
  sql_table_name: `output.TD_PRODUCTO` ;;

  dimension: cod_producto {
    type: string
    sql: ${TABLE}.COD_PRODUCTO ;;
  }
  dimension: desc_producto {
    type: string
    sql: ${TABLE}.DESC_PRODUCTO ;;
  }
  measure: count {
    type: count
  }
}
