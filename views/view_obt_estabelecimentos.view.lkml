view: view_obt_estabelecimentos {
  sql_table_name: `dayanepadilha-477-202302281139.open_data_br_Panizzo.view_obt_estabelecimentos` ;;

  dimension: cd_cep {
    type: string
    sql: ${TABLE}.cd_cep ;;
  }
  dimension: cd_cnae_fiscal_principal {
    type: string
    sql: ${TABLE}.cd_cnae_fiscal_principal ;;
  }
  dimension: cd_cnae_fiscal_secundaria {
    type: string
    sql: ${TABLE}.cd_cnae_fiscal_secundaria ;;
  }
  dimension: cd_matriz_filial {
    type: string
    sql: ${TABLE}.cd_matriz_filial ;;
  }
  dimension: cd_motivo_situacao_cadastral {
    type: string
    sql: ${TABLE}.cd_motivo_situacao_cadastral ;;
  }
  dimension: cd_municipio {
    type: string
    sql: ${TABLE}.cd_municipio ;;
  }
  dimension: cd_pais {
    type: string
    sql: ${TABLE}.cd_pais ;;
  }
  dimension: cd_porte_empresa {
    type: string
    sql: ${TABLE}.cd_porte_empresa ;;
  }
  dimension: cd_situacao_cadastral {
    type: string
    sql: ${TABLE}.cd_situacao_cadastral ;;
  }
  dimension: cd_tipo_logradouro {
    type: string
    sql: ${TABLE}.cd_tipo_logradouro ;;
  }
  dimension: ds_cnae_fiscal_principal {
    type: string
    sql: ${TABLE}.ds_cnae_fiscal_principal ;;
  }
  dimension: ds_complemento {
    type: string
    sql: ${TABLE}.ds_complemento ;;
  }
  dimension: ds_correio_eletronico {
    type: string
    sql: ${TABLE}.ds_correio_eletronico ;;
  }
  dimension: ds_motivo_situacao_cadastral {
    type: string
    sql: ${TABLE}.ds_motivo_situacao_cadastral ;;
  }
  dimension: ds_situacao_especial {
    type: string
    sql: ${TABLE}.ds_situacao_especial ;;
  }
  dimension_group: dt_exclusao_mei {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_exclusao_mei ;;
  }
  dimension_group: dt_exclusao_simples {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_exclusao_simples ;;
  }
  dimension_group: dt_inicio_atividade {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_inicio_atividade ;;
  }
  dimension_group: dt_opcao_mei {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_opcao_mei ;;
  }
  dimension_group: dt_opcao_simples {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_opcao_simples ;;
  }
  dimension_group: dt_situacao_cadastral {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_situacao_cadastral ;;
  }
  dimension_group: dt_situacao_especial {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_situacao_especial ;;
  }
  dimension: in_opcao_mei {
    type: string
    sql: ${TABLE}.in_opcao_mei ;;
  }
  dimension: in_opcao_simples {
    type: string
    sql: ${TABLE}.in_opcao_simples ;;
  }
  dimension: nm_bairro {
    type: string
    sql: ${TABLE}.nm_bairro ;;
  }
  dimension: nm_cidade_exterior {
    type: string
    sql: ${TABLE}.nm_cidade_exterior ;;
  }
  dimension: nm_fantasia {
    type: string
    sql: ${TABLE}.nm_fantasia ;;
  }
  dimension: nm_logradouro {
    type: string
    sql: ${TABLE}.nm_logradouro ;;
  }
  dimension: nm_municipio {
    type: string
    sql: ${TABLE}.nm_municipio ;;
  }
  dimension: nm_natureza_juridica {
    type: string
    sql: ${TABLE}.nm_natureza_juridica ;;
  }
  dimension: nm_pais {
    type: string
    sql: ${TABLE}.nm_pais ;;
  }
  dimension: nm_razao_social {
    type: string
    sql: ${TABLE}.nm_razao_social ;;
  }
  dimension: nr_cnpj_basico {
    type: string
    sql: ${TABLE}.nr_cnpj_basico ;;
  }
  dimension: nr_cnpj_dv {
    type: string
    sql: ${TABLE}.nr_cnpj_dv ;;
  }
  dimension: nr_cnpj_ordem {
    type: string
    sql: ${TABLE}.nr_cnpj_ordem ;;
  }
  dimension: nr_ddd_1 {
    type: string
    sql: ${TABLE}.nr_ddd_1 ;;
  }
  dimension: nr_ddd_2 {
    type: string
    sql: ${TABLE}.nr_ddd_2 ;;
  }
  dimension: nr_ddd_fax {
    type: string
    sql: ${TABLE}.nr_ddd_fax ;;
  }
  dimension: nr_fax {
    type: string
    sql: ${TABLE}.nr_fax ;;
  }
  dimension: nr_logradouro {
    type: string
    sql: ${TABLE}.nr_logradouro ;;
  }
  dimension: nr_telefone_1 {
    type: string
    sql: ${TABLE}.nr_telefone_1 ;;
  }
  dimension: nr_telefone_2 {
    type: string
    sql: ${TABLE}.nr_telefone_2 ;;
  }
  dimension: sg_uf {
    type: string
    sql: ${TABLE}.sg_uf ;;
  }
  measure: count {
    type: count
  }
}
