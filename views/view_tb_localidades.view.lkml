view: view_tb_localidades {
  sql_table_name: `dayanepadilha-477-202302281139.open_data_br_Panizzo.view_tb_localidades` ;;

  dimension: id_mesorregiao {
    type: number
    sql: ${TABLE}.id_mesorregiao ;;
  }
  dimension: id_microrregiao {
    type: number
    sql: ${TABLE}.id_microrregiao ;;
  }
  dimension: id_municipio {
    type: number
    sql: ${TABLE}.id_municipio ;;
  }
  dimension: id_regiao {
    type: number
    sql: ${TABLE}.id_regiao ;;
  }
  dimension: id_uf {
    type: number
    sql: ${TABLE}.id_uf ;;
  }
  dimension: nm_mesorregiao {
    type: string
    sql: ${TABLE}.nm_mesorregiao ;;
  }
  dimension: nm_microrregiao {
    type: string
    sql: ${TABLE}.nm_microrregiao ;;
  }
  dimension: nm_municipio {
    type: string
    sql: ${TABLE}.nm_municipio ;;
  }
  dimension: nm_regiao {
    type: string
    sql: ${TABLE}.nm_regiao ;;
  }
  dimension: nm_uf {
    type: string
    sql: ${TABLE}.nm_uf ;;
  }
  dimension: sg_regiao {
    type: string
    sql: ${TABLE}.sg_regiao ;;
  }
  dimension: sg_uf {
    type: string
    sql: ${TABLE}.sg_uf ;;
  }
  measure: count {
    type: count
  }
}
