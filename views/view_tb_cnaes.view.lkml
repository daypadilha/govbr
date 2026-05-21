view: view_tb_cnaes {
  sql_table_name: `dayanepadilha-477-202302281139.open_data_br_Panizzo.view_tb_cnaes` ;;

  dimension: ds_classe {
    type: string
    sql: ${TABLE}.ds_classe ;;
  }
  dimension: ds_divisao {
    type: string
    sql: ${TABLE}.ds_divisao ;;
  }
  dimension: ds_grupo {
    type: string
    sql: ${TABLE}.ds_grupo ;;
  }
  dimension: ds_secao {
    type: string
    sql: ${TABLE}.ds_secao ;;
  }
  dimension: ds_subclasse {
    type: string
    sql: ${TABLE}.ds_subclasse ;;
  }
  dimension: id_classe {
    type: string
    sql: ${TABLE}.id_classe ;;
  }
  dimension: id_divisao {
    type: string
    sql: ${TABLE}.id_divisao ;;
  }
  dimension: id_grupo {
    type: string
    sql: ${TABLE}.id_grupo ;;
  }
  dimension: id_secao {
    type: string
    sql: ${TABLE}.id_secao ;;
  }
  dimension: id_subclasse {
    type: string
    sql: ${TABLE}.id_subclasse ;;
  }
  measure: count {
    type: count
  }
}
