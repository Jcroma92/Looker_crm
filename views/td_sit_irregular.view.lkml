view: td_sit_irregular {
  sql_table_name: `output.TD_SIT_IRREGULAR` ;;

  dimension: cod_sit_irreg {
    type: string
    sql: ${TABLE}.COD_SIT_IRREG ;;
  }
  dimension: desc_sit_irreg {
    type: string
    sql: ${TABLE}.DESC_SIT_IRREG ;;
  }
  measure: count {
    type: count
  }
}
