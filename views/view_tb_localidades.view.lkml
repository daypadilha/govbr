view: view_tb_localidades {
  sql_table_name: `dayanepadilha-477-202302281139.open_data_br_Panizzo.view_tb_localidades` ;;

  dimension: id_mesorregiao {
    type: number
    label: "Código da Mesorregião"
    description: "Código identificador da mesorregião geográfica determinado pelo IBGE."
    sql: ${TABLE}.id_mesorregiao ;;
  }
  dimension: id_microrregiao {
    type: number
    label: "Código da Microrregião"
    description: "Código identificador da microrregião geográfica determinado pelo IBGE."
    sql: ${TABLE}.id_microrregiao ;;
  }
  dimension: id_municipio {
    type: number
    label: "Código do Município"
    description: "Código identificador de 7 dígitos do município correspondente ao padrão IBGE."
    sql: ${TABLE}.id_municipio ;;
  }
  dimension: id_regiao {
    type: number
    label: "Código da Região"
    description: "Código identificador da região geopolítica do Brasil."
    sql: ${TABLE}.id_regiao ;;
  }
  dimension: id_uf {
    type: number
    label: "Código da UF"
    description: "Código identificador de 2 dígitos da Unidade da Federação correspondente ao padrão IBGE."
    sql: ${TABLE}.id_uf ;;
  }
  dimension: nm_mesorregiao {
    type: string
    label: "Nome da Mesorregião"
    description: "Nome da mesorregião geográfica do município."
    sql: ${TABLE}.nm_mesorregiao ;;
  }
  dimension: nm_microrregiao {
    type: string
    label: "Nome da Microrregião"
    description: "Nome da microrregião geográfica do município."
    sql: ${TABLE}.nm_microrregiao ;;
  }
  dimension: nm_municipio {
    type: string
    label: "Nome do Município"
    description: "Nome oficial do município."
    sql: ${TABLE}.nm_municipio ;;
  }
  dimension: nm_regiao {
    type: string
    label: "Nome da Região"
    description: "Nome oficial da região geopolítica do Brasil (Norte, Nordeste, Sudeste, Sul, Centro-Oeste)."
    sql: ${TABLE}.nm_regiao ;;
  }
  dimension: nm_uf {
    type: string
    label: "Nome da UF"
    description: "Nome oficial do Estado (Unidade da Federação)."
    sql: ${TABLE}.nm_uf ;;
  }
  dimension: sg_regiao {
    type: string
    label: "Sigla da Região"
    description: "Sigla correspondente à região geopolítica do Brasil."
    sql: ${TABLE}.sg_regiao ;;
  }
  dimension: sg_uf {
    type: string
    label: "Sigla da UF"
    description: "Sigla oficial de 2 letras da Unidade da Federação (ex: SP, RJ, MG)."
    sql: ${TABLE}.sg_uf ;;
  }
  measure: count {
    type: count
    label: "Quantidade de Localidades"
    description: "Quantidade total de registros de localidades cadastrados."
  }
}
