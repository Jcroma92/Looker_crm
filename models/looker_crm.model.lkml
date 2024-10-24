connection: "bq_prj-d-rsi-data-irbpoc-01_output"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: looker_crm_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_crm_default_datagroup

explore: mda_ac_datos_fmes_rep {
  label: "Cartera crediticia CRM"
  description: "Estado de la cartera crediticia de una entidad a una fecha"

  join: mda_ac_dia_rep {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_dia_rep.mi_fecha_proc_date} = ${mda_ac_datos_fmes_rep.mi_fecha_fin_mes_date}
          AND ${mda_ac_dia_rep.cod_nrbe_en} = ${mda_ac_datos_fmes_rep.cod_nrbe_en}
          AND ${mda_ac_dia_rep.num_sec_ac} = ${mda_ac_datos_fmes_rep.num_sec_ac} ;;
  }

  join: td_garantia {
    relationship: one_to_many
    sql_on: ${mda_ac_dia_rep.cod_grtia_ac} = ${td_garantia.cod_grtia_ac} ;;
    type: inner
  }

  join: td_linea {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_dia_rep.cod_linea} = ${td_linea.cod_linea} ;;
  }

  join: td_origen {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_dia_rep.cod_orgn_ac} = ${td_origen.cod_origen} ;;
  }

  join: td_periodo_prueba {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_dia_rep.sit_def_per_prba} = ${td_periodo_prueba.sit_def_per_prba} ;;
  }

  join: td_producto {
    relationship: one_to_many
    type: inner
    sql_on: concat(${mda_ac_dia_rep.cod_linea}, ${mda_ac_dia_rep.id_grp_pd}) = ${td_producto.cod_producto} ;;
  }

  join: td_segmento {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_datos_fmes_rep.ndd_cod_ctg_clte} = ${td_segmento.ndd_cod_ctg_clte} ;;
  }

  join: td_sit_irregular {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_dia_rep.cod_sit_irreg} = ${td_sit_irregular.cod_sit_irreg} ;;
  }

  join: td_situacion_default {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_dia_rep.situacion_default} = ${td_situacion_default.situacion_default} ;;
  }

  join: dim_tiempo {
    relationship: one_to_many
    type: inner
    sql_on: ${mda_ac_dia_rep.mi_fecha_proc_date} = ${dim_tiempo.fecha_date} ;;
  }
}
