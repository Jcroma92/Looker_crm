view: td_garantia {
  sql_table_name: `output.TD_GARANTIA` ;;

  dimension: cod_grtia_ac {
    type: string
    sql: ${TABLE}.COD_GRTIA_AC ;;
  }
  dimension: desc_garantia {
    type: string
    sql: ${TABLE}.DESC_GARANTIA ;;
  }
  measure: count {
    type: count
  }
}
