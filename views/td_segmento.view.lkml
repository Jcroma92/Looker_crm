view: td_segmento {
  sql_table_name: `output.TD_SEGMENTO` ;;

  dimension: desc_segmento {
    type: string
    sql: ${TABLE}.DESC_SEGMENTO ;;
  }
  dimension: ndd_cod_ctg_clte {
    type: string
    sql: ${TABLE}.NDD_COD_CTG_CLTE ;;
  }
  measure: count {
    type: count
  }
}
