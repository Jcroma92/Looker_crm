view: mda_ac_datos_fmes_rep {
  sql_table_name: `output.MDA_AC_DATOS_FMES_REP` ;;


  dimension: cod_nrbe_en {

    type: string
    sql: ${TABLE}.COD_NRBE_EN ;;
  }


  dimension_group: mi_fecha_fin_mes {

    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MI_FECHA_FIN_MES ;;
  }
  dimension: ndd_cod_ctg_clte {
    type: string
    sql: ${TABLE}.NDD_COD_CTG_CLTE ;;
  }
  dimension: num_sec_ac {
    primary_key: yes
    type: number
    sql: ${TABLE}.NUM_SEC_AC ;;
  }

  dimension: situacion_default {
    type: string
    sql: ${TABLE}.SITUACION_DEFAULT ;;
  }
  measure: count {
    type: count
  }
}
