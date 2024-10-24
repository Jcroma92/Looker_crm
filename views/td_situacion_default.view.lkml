view: td_situacion_default {
  sql_table_name: `output.TD_SITUACION_DEFAULT` ;;

  dimension: desc_default {
    type: string
    sql: ${TABLE}.DESC_DEFAULT ;;
  }
  dimension: situacion_default {
    type: string
    sql: ${TABLE}.SITUACION_DEFAULT ;;
  }
  measure: count {
    type: count
  }
}
