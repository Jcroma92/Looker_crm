view: td_origen {
  sql_table_name: `output.TD_ORIGEN` ;;

  dimension: cod_origen {
    type: string
    sql: ${TABLE}.COD_ORIGEN ;;
  }
  dimension: desc_origen {
    type: string
    sql: ${TABLE}.DESC_ORIGEN ;;
  }
  measure: count {
    type: count
  }
}
