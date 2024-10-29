view: mda_ac_dia_rep {
  sql_table_name: `output.MDA_AC_DIA_REP` ;;


  dimension: cod_grtia_ac {
    type: string
    sql: ${TABLE}.COD_GRTIA_AC ;;
  }
  dimension: cod_linea {
    type: string
    sql: ${TABLE}.COD_LINEA ;;
  }
  dimension: cod_nrbe_en {

    type: string
    sql: ${TABLE}.COD_NRBE_EN ;;
  }

  dimension: cod_orgn_ac {
    type: string
    sql: ${TABLE}.COD_ORGN_AC ;;
  }
  dimension: cod_sit_irreg {
    type: string
    sql: ${TABLE}.COD_SIT_IRREG ;;
  }

  dimension: id_grp_pd {
    type: string
    sql: ${TABLE}.ID_GRP_PD ;;
  }
  dimension: id_interno_pe {
    type: number
    sql: ${TABLE}.ID_INTERNO_PE ;;
  }

  dimension_group: mi_fecha_proc {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MI_FECHA_PROC ;;
  }

  dimension: mi_sdo_dud_comisio {
    type: number
    sql: ${TABLE}.MI_SDO_DUD_COMISIO ;;
  }

  dimension: mi_sdo_dud_gastos {
    type: number
    sql: ${TABLE}.MI_SDO_DUD_GASTOS ;;
  }

  dimension: mi_sdo_dud_interes {
    type: number
    sql: ${TABLE}.MI_SDO_DUD_INTERES ;;
  }
  dimension: mi_sdo_dud_pte_vto {
    type: number
    sql: ${TABLE}.MI_SDO_DUD_PTE_VTO ;;
  }
  dimension: mi_sdo_dud_vencido {
    type: number
    sql: ${TABLE}.MI_SDO_DUD_VENCIDO ;;
  }
  dimension: num_sec_ac {
    primary_key: yes
    type: number
    sql: ${TABLE}.NUM_SEC_AC ;;
  }

  dimension: sit_def_per_prba {
    type: string
    sql: ${TABLE}.SIT_DEF_PER_PRBA ;;
  }
  dimension: sit_default_ant {
    type: string
    sql: ${TABLE}.SIT_DEFAULT_ANT ;;
  }

  dimension: sit_default_obj {
    type: string
    sql: ${TABLE}.SIT_DEFAULT_OBJ ;;
  }
  dimension: sit_default_subj {
    type: string
    sql: ${TABLE}.SIT_DEFAULT_SUBJ ;;
  }

  dimension: situacion_default {
    type: string
    sql: ${TABLE}.SITUACION_DEFAULT ;;
  }

  dimension: cod_producto {
    type: string
    sql: concat(${TABLE}.COD_LINEA, ${TABLE}.ID_GRP_PD) ;;
  }
  dimension_group: Fecha_Fin_Mes_Sig{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: LAST_DAY(DATE_ADD(${TABLE}.MI_FECHA_PROC, INTERVAL 1 MONTH)) ;;
  }
  dimension_group: Fecha_Mes_Ant{
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: LAST_DAY(DATE_ADD(${TABLE}.MI_FECHA_PROC, INTERVAL -1 MONTH)) ;;
  }
  measure: Saldo_Total_Acuerdo{
    type: sum
    sql: ${mi_sdo_dud_comisio}+${mi_sdo_dud_gastos}+${mi_sdo_dud_interes}+${mi_sdo_dud_vencido}+${mi_sdo_dud_pte_vto} ;;
    value_format_name: eur
  }

  measure: Saldo_Impagado{
    type: sum
    sql: ${mi_sdo_dud_comisio}+${mi_sdo_dud_gastos}+${mi_sdo_dud_interes}+${mi_sdo_dud_vencido} ;;
    value_format_name: eur
  }

  measure: n_acuerdos {
    type: count_distinct
    sql: ${num_sec_ac} ;;  # Puedes usar un campo único para contar acuerdos, como el identificador del acuerdo (num_sec_ac)
    label: "Nº Acuerdos"
  }
  }
