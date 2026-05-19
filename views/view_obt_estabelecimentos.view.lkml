view: view_obt_estabelecimentos {
  label: "Estabelecimentos"
  sql_table_name: `dayanepadilha-477-202302281139.open_data_br_Panizzo.view_obt_estabelecimentos` ;;

  dimension: cd_cep {
    type: string
    label: "CEP"
    sql: ${TABLE}.cd_cep ;;
  }
  dimension: cd_cnae_fiscal_principal {
    type: string
    label: "Código CNAE Fiscal Principal"
    sql: ${TABLE}.cd_cnae_fiscal_principal ;;
  }
  dimension: cd_cnae_fiscal_secundaria {
    type: string
    label: "Código CNAE Fiscal Secundária"
    sql: ${TABLE}.cd_cnae_fiscal_secundaria ;;
  }
  dimension: cd_matriz_filial {
    type: string
    label: "Código Matriz/Filial"
    sql: ${TABLE}.cd_matriz_filial ;;
  }
  dimension: cd_motivo_situacao_cadastral {
    type: string
    label: "Código Motivo Situação Cadastral"
    sql: ${TABLE}.cd_motivo_situacao_cadastral ;;
  }
  dimension: cd_municipio {
    type: string
    label: "Código Município"
    sql: ${TABLE}.cd_municipio ;;
  }
  dimension: cd_pais {
    type: string
    label: "Código País"
    sql: ${TABLE}.cd_pais ;;
  }
  dimension: cd_porte_empresa {
    type: string
    label: "Código Porte Empresa"
    sql: ${TABLE}.cd_porte_empresa ;;
  }
  dimension: cd_situacao_cadastral {
    type: string
    label: "Código Situação Cadastral"
    sql: ${TABLE}.cd_situacao_cadastral ;;
  }
  dimension: cd_tipo_logradouro {
    type: string
    label: "Código Tipo Logradouro"
    sql: ${TABLE}.cd_tipo_logradouro ;;
  }
  dimension: ds_cnae_fiscal_principal {
    type: string
    label: "Descrição CNAE Fiscal Principal"
    sql: ${TABLE}.ds_cnae_fiscal_principal ;;
  }
  dimension: ds_complemento {
    type: string
    label: "Complemento"
    sql: ${TABLE}.ds_complemento ;;
  }
  dimension: ds_correio_eletronico {
    type: string
    label: "Email"
    sql: ${TABLE}.ds_correio_eletronico ;;
  }
  dimension: ds_motivo_situacao_cadastral {
    type: string
    label: "Motivo Situação Cadastral"
    sql: ${TABLE}.ds_motivo_situacao_cadastral ;;
  }
  dimension: ds_situacao_especial {
    type: string
    label: "Situação Especial"
    sql: ${TABLE}.ds_situacao_especial ;;
  }
  dimension_group: dt_exclusao_mei {
    type: time
    label: "Data Exclusão MEI"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_exclusao_mei ;;
  }
  dimension_group: dt_exclusao_simples {
    type: time
    label: "Data Exclusão Simples"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_exclusao_simples ;;
  }
  dimension_group: dt_inicio_atividade {
    type: time
    label: "Data Início Atividade"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_inicio_atividade ;;
  }
  dimension_group: dt_opcao_mei {
    type: time
    label: "Data Opção MEI"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_opcao_mei ;;
  }
  dimension_group: dt_opcao_simples {
    type: time
    label: "Data Opção Simples"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_opcao_simples ;;
  }
  dimension_group: dt_situacao_cadastral {
    type: time
    label: "Data Situação Cadastral"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_situacao_cadastral ;;
  }
  dimension_group: dt_situacao_especial {
    type: time
    label: "Data Situação Especial"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_situacao_especial ;;
  }
  dimension: in_opcao_mei {
    type: string
    label: "Opção MEI"
    sql: ${TABLE}.in_opcao_mei ;;
  }
  dimension: in_opcao_simples {
    type: string
    label: "Opção Simples"
    sql: ${TABLE}.in_opcao_simples ;;
  }
  dimension: nm_bairro {
    type: string
    label: "Bairro"
    sql: ${TABLE}.nm_bairro ;;
  }
  dimension: nm_cidade_exterior {
    type: string
    label: "Cidade Exterior"
    sql: ${TABLE}.nm_cidade_exterior ;;
  }
  dimension: nm_fantasia {
    type: string
    label: "Nome Fantasia"
    sql: ${TABLE}.nm_fantasia ;;
  }
  dimension: nm_logradouro {
    type: string
    label: "Logradouro"
    sql: ${TABLE}.nm_logradouro ;;
  }
  dimension: nm_municipio {
    type: string
    label: "Município"
    sql: ${TABLE}.nm_municipio ;;
  }
  dimension: nm_natureza_juridica {
    type: string
    label: "Natureza Jurídica"
    sql: ${TABLE}.nm_natureza_juridica ;;
  }
  dimension: nm_pais {
    type: string
    label: "País"
    sql: ${TABLE}.nm_pais ;;
  }
  dimension: nm_razao_social {
    type: string
    label: "Razão Social"
    sql: ${TABLE}.nm_razao_social ;;
  }
  dimension: nr_cnpj_basico {
    type: string
    label: "CNPJ Básico"
    sql: ${TABLE}.nr_cnpj_basico ;;
  }
  dimension: nr_cnpj_dv {
    type: string
    label: "CNPJ Dígito Verificador"
    sql: ${TABLE}.nr_cnpj_dv ;;
  }
  dimension: nr_cnpj_ordem {
    type: string
    label: "CNPJ Ordem"
    sql: ${TABLE}.nr_cnpj_ordem ;;
  }
  dimension: nr_ddd_1 {
    type: string
    label: "DDD Telefone 1"
    sql: ${TABLE}.nr_ddd_1 ;;
  }
  dimension: nr_ddd_2 {
    type: string
    label: "DDD Telefone 2"
    sql: ${TABLE}.nr_ddd_2 ;;
  }
  dimension: nr_ddd_fax {
    type: string
    label: "DDD Fax"
    sql: ${TABLE}.nr_ddd_fax ;;
  }
  dimension: nr_fax {
    type: string
    label: "Fax"
    sql: ${TABLE}.nr_fax ;;
  }
  dimension: nr_logradouro {
    type: string
    label: "Número"
    sql: ${TABLE}.nr_logradouro ;;
  }
  dimension: nr_telefone_1 {
    type: string
    label: "Telefone 1"
    sql: ${TABLE}.nr_telefone_1 ;;
  }
  dimension: nr_telefone_2 {
    type: string
    label: "Telefone 2"
    sql: ${TABLE}.nr_telefone_2 ;;
  }
  dimension: sg_uf {
    type: string
    label: "UF"
    sql: ${TABLE}.sg_uf ;;
  }
  measure: count {
    type: count
    label: "Quantidade"
  }
}
