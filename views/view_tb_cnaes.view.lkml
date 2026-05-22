view: view_tb_cnaes {
  sql_table_name: `dayanepadilha-477-202302281139.open_data_br_Panizzo.view_tb_cnaes` ;;

  dimension: ds_classe {
    type: string
    label: "Descrição da Classe"
    description: "Descrição da classe da CNAE."
    sql: ${TABLE}.ds_classe ;;
  }
  dimension: ds_divisao {
    type: string
    label: "Descrição da Divisão"
    description: "Descrição da divisão da CNAE."
    sql: ${TABLE}.ds_divisao ;;
  }
  dimension: ds_grupo {
    type: string
    label: "Descrição do Grupo"
    description: "Descrição do grupo da CNAE."
    sql: ${TABLE}.ds_grupo ;;
  }
  dimension: ds_secao {
    type: string
    label: "Descrição da Seção"
    description: "Descrição da seção da CNAE (nível mais genérico da classificação)."
    sql: ${TABLE}.ds_secao ;;
  }
  dimension: ds_subclasse {
    type: string
    label: "Descrição da Subclasse"
    description: "Descrição da subclasse da CNAE (nível mais específico da classificação)."
    sql: ${TABLE}.ds_subclasse ;;
  }
  dimension: id_classe {
    type: string
    label: "Código da Classe"
    description: "Código identificador correspondente à classe da CNAE."
    sql: ${TABLE}.id_classe ;;
  }
  dimension: id_divisao {
    type: string
    label: "Código da Divisão"
    description: "Código identificador correspondente à divisão da CNAE."
    sql: ${TABLE}.id_divisao ;;
  }
  dimension: id_grupo {
    type: string
    label: "Código do Grupo"
    description: "Código identificador correspondente ao grupo da CNAE."
    sql: ${TABLE}.id_grupo ;;
  }
  dimension: id_secao {
    type: string
    label: "Código da Seção"
    description: "Código identificador correspondente à seção da CNAE."
    sql: ${TABLE}.id_secao ;;
  }
  dimension: id_subclasse {
    type: string
    label: "Código da Subclasse"
    description: "Código identificador correspondente à subclasse da CNAE."
    sql: ${TABLE}.id_subclasse ;;
  }
  measure: count {
    type: count
    label: "Quantidade de CNAEs"
    description: "Quantidade total de registros de CNAE cadastrados."
  }
}
