view: view_obt_estabelecimentos {
  label: "Estabelecimentos"
  sql_table_name: `dayanepadilha-477-202302281139.open_data_br_Panizzo.view_obt_estabelecimentos` ;;

  dimension: cd_cep {
    type: string
    group_label: "Endereço"
    label: "CEP"
    sql: ${TABLE}.cd_cep ;;
  }
  dimension: cd_cnae_fiscal_principal {
    type: string
    group_label: "Classificação (CNAE)"
    label: "Código CNAE Fiscal Principal"
    sql: ${TABLE}.cd_cnae_fiscal_principal ;;
  }
  dimension: cd_cnae_fiscal_secundaria {
    type: string
    group_label: "Classificação (CNAE)"
    label: "Código CNAE Fiscal Secundária"
    sql: ${TABLE}.cd_cnae_fiscal_secundaria ;;
  }
  dimension: cd_matriz_filial {
    type: string
    group_label: "Identificação da Empresa"
    label: "Código Matriz/Filial"
    description: "Identifica se o estabelecimento é a matriz ou uma filial."
    sql: ${TABLE}.cd_matriz_filial ;;
  }
  dimension: cd_motivo_situacao_cadastral {
    type: string
    group_label: "Situação Cadastral"
    label: "Código Motivo Situação Cadastral"
    sql: ${TABLE}.cd_motivo_situacao_cadastral ;;
  }
  dimension: cd_municipio {
    type: number
    group_label: "Endereço"
    label: "Código Município"
    sql: cast(${TABLE}.cd_municipio as integer) ;;
  }
  dimension: cd_pais {
    type: string
    group_label: "Endereço"
    label: "Código País"
    sql: ${TABLE}.cd_pais ;;
  }
  dimension: cd_porte_empresa {
    type: string
    group_label: "Identificação da Empresa"
    label: "Código Porte Empresa"
    sql: ${TABLE}.cd_porte_empresa ;;
  }
  dimension: cd_situacao_cadastral {
    type: string
    group_label: "Situação Cadastral"
    label: "Código Situação Cadastral"
    sql: ${TABLE}.cd_situacao_cadastral ;;
  }
  dimension: cd_tipo_logradouro {
    type: string
    group_label: "Endereço"
    label: "Código Tipo Logradouro"
    sql: ${TABLE}.cd_tipo_logradouro ;;
  }
  dimension: ds_cnae_fiscal_principal {
    type: string
    group_label: "Classificação (CNAE)"
    label: "Descrição CNAE Fiscal Principal"
    sql: ${TABLE}.ds_cnae_fiscal_principal ;;
  }
  dimension: ds_complemento {
    type: string
    group_label: "Endereço"
    label: "Complemento"
    sql: ${TABLE}.ds_complemento ;;
  }
  dimension: ds_correio_eletronico {
    type: string
    group_label: "Contato"
    label: "Email"
    sql: ${TABLE}.ds_correio_eletronico ;;
  }
  dimension: ds_motivo_situacao_cadastral {
    type: string
    group_label: "Situação Cadastral"
    label: "Motivo Situação Cadastral"
    sql: ${TABLE}.ds_motivo_situacao_cadastral ;;
  }
  dimension: ds_situacao_especial {
    type: string
    group_label: "Situação Cadastral"
    label: "Situação Especial"
    sql: ${TABLE}.ds_situacao_especial ;;
  }
  dimension_group: dt_exclusao_mei {
    type: time
    group_label: "Datas Importantes"
    label: "Data Exclusão MEI"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_exclusao_mei ;;
  }
  dimension_group: dt_exclusao_simples {
    type: time
    group_label: "Datas Importantes"
    label: "Data Exclusão Simples"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_exclusao_simples ;;
  }
  dimension_group: dt_inicio_atividade {
    type: time
    group_label: "Datas Importantes"
    label: "Data Início Atividade"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_inicio_atividade ;;
  }
  dimension_group: dt_opcao_mei {
    type: time
    group_label: "Datas Importantes"
    label: "Data Opção MEI"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_opcao_mei ;;
  }
  dimension_group: dt_opcao_simples {
    type: time
    group_label: "Datas Importantes"
    label: "Data Opção Simples"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_opcao_simples ;;
  }
  dimension_group: dt_situacao_cadastral {
    type: time
    group_label: "Datas Importantes"
    label: "Data Situação Cadastral"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_situacao_cadastral ;;
  }
  dimension_group: dt_situacao_especial {
    type: time
    group_label: "Datas Importantes"
    label: "Data Situação Especial"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt_situacao_especial ;;
  }
  dimension: in_opcao_mei {
    type: string
    group_label: "Regime Tributário"
    label: "Opção MEI"
    case: {
      when: {
        sql: ${TABLE}.in_opcao_mei = 'S' ;;
        label: "Sim"
      }
      when: {
        sql: ${TABLE}.in_opcao_mei = 'N' ;;
        label: "Não"
      }
      else: "Não se aplica"
    }
  }

  dimension: in_opcao_simples {
    type: string
    group_label: "Regime Tributário"
    label: "Opção Simples"
    case: {
      when: {
        sql: ${TABLE}.in_opcao_simples = 'S' ;;
        label: "Sim"
      }
      when: {
        sql: ${TABLE}.in_opcao_simples = 'N' ;;
        label: "Não"
      }
      else: "Não se aplica"
    }
  }
  dimension: nm_bairro {
    type: string
    group_label: "Endereço"
    label: "Bairro"
    sql: ${TABLE}.nm_bairro ;;
  }
  dimension: nm_cidade_exterior {
    type: string
    group_label: "Endereço"
    label: "Cidade Exterior"
    sql: ${TABLE}.nm_cidade_exterior ;;
  }
  dimension: nm_fantasia {
    type: string
    group_label: "Identificação da Empresa"
    label: "Nome Fantasia"
    sql: ${TABLE}.nm_fantasia ;;
  }
  dimension: nm_logradouro {
    type: string
    group_label: "Endereço"
    label: "Logradouro"
    sql: ${TABLE}.nm_logradouro ;;
  }
  dimension: nm_municipio {
    type: string
    group_label: "Endereço"
    label: "Município"
    sql: ${TABLE}.nm_municipio ;;
  }
  dimension: nm_natureza_juridica {
    type: string
    group_label: "Identificação da Empresa"
    label: "Natureza Jurídica"
    sql: ${TABLE}.nm_natureza_juridica ;;
  }
  dimension: nm_pais {
    type: string
    group_label: "Endereço"
    label: "País"
    sql: ${TABLE}.nm_pais ;;
  }
  dimension: nm_razao_social {
    type: string
    group_label: "Identificação da Empresa"
    label: "Razão Social"
    sql: ${TABLE}.nm_razao_social ;;
  }
  dimension: nr_cnpj_basico {
    hidden: yes
    type: string
    group_label: "Identificação da Empresa"
    label: "CNPJ Básico"
    sql: ${TABLE}.nr_cnpj_basico ;;
  }
  dimension: nr_cnpj_dv {
    type: string
    group_label: "Identificação da Empresa"
    label: "CNPJ Dígito Verificador"
    sql: ${TABLE}.nr_cnpj_dv ;;
  }
  dimension: nr_cnpj_ordem {
    hidden: yes
    type: string
    group_label: "Identificação da Empresa"
    label: "CNPJ Ordem"
    sql: ${TABLE}.nr_cnpj_ordem ;;
  }
  dimension: nr_cnpj_completo {
    group_label: "Identificação da Empresa"
    label: "CNPJ Completo"
    description: "CNPJ completo do estabelecimento, com 14 dígitos."
    sql: LPAD(${TABLE}.nr_cnpj_basico, 8, '0') || LPAD(${TABLE}.nr_cnpj_ordem, 4, '0') || LPAD(${TABLE}.nr_cnpj_dv, 2, '0') ;;
    link: {
      label: "Consultar na Receita Federal"
      url: "https://www.cnpjs.info/{{ value }}"
      icon_url: "https://www.google.com/s2/favicons?domain=cnpjs.info"
    }
  }
  dimension: nr_ddd_1 {
    type: string
    group_label: "Contato"
    label: "DDD Telefone 1"
    sql: ${TABLE}.nr_ddd_1 ;;
  }
  dimension: nr_ddd_2 {
    type: string
    group_label: "Contato"
    label: "DDD Telefone 2"
    sql: ${TABLE}.nr_ddd_2 ;;
  }
  dimension: nr_ddd_fax {
    type: string
    group_label: "Contato"
    label: "DDD Fax"
    sql: ${TABLE}.nr_ddd_fax ;;
  }
  dimension: nr_fax {
    type: string
    group_label: "Contato"
    label: "Fax"
    sql: ${TABLE}.nr_fax ;;
  }
  dimension: nr_logradouro {
    type: string
    group_label: "Endereço"
    label: "Número"
    sql: ${TABLE}.nr_logradouro ;;
  }
  dimension: nr_telefone_1 {
    type: string
    group_label: "Contato"
    label: "Telefone 1"
    sql: ${TABLE}.nr_telefone_1 ;;
  }
  dimension: nr_telefone_2 {
    type: string
    group_label: "Contato"
    label: "Telefone 2"
    sql: ${TABLE}.nr_telefone_2 ;;
  }
  dimension: sg_uf {
    type: string
    group_label: "Endereço"
    label: "UF"
    sql: ${TABLE}.sg_uf ;;
  }
  measure: count {
    type: count
    label: "Quantidade"
    drill_fields: [nm_fantasia, nm_razao_social, nr_cnpj_completo]
  }
  measure: count_distinct_cnpj {
    type: count_distinct
    label: "Total de CNPJs Únicos"
    sql: ${nr_cnpj_completo} ;;
  }
}
