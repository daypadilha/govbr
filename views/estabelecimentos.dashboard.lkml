- dashboard: estabelecimentos
  title: "Análise de Estabelecimentos no Brasil"
  layout: newspaper
  preferred_viewer: dashboards-next

  filters:
  - name: data_de_inicio_da_atividade
    title: "Data de Início da Atividade"
    type: date_filter
    explore: view_obt_estabelecimentos
    field: view_obt_estabelecimentos.dt_inicio_atividade_date
    default_value: 10 years

  - name: uf
    title: "UF"
    type: field_filter
    explore: view_obt_estabelecimentos
    field: view_obt_estabelecimentos.sg_uf
    allow_multiple_values: true

  - name: situacao_cadastral
    title: "Situação Cadastral"
    type: field_filter
    explore: view_obt_estabelecimentos
    field: view_obt_estabelecimentos.ds_motivo_situacao_cadastral
    allow_multiple_values: true

  elements:
  - name: total_de_estabelecimentos
    title: "Total de Estabelecimentos"
    type: single_value
    explore: view_obt_estabelecimentos
    query:
      measures: [view_obt_estabelecimentos.count]
      listen:
        data_de_inicio_da_atividade: view_obt_estabelecimentos.dt_inicio_atividade_date
        uf: view_obt_estabelecimentos.sg_uf
        situacao_cadastral: view_obt_estabelecimentos.ds_motivo_situacao_cadastral
    row: 0
    col: 0
    width: 6
    height: 3

  - name: total_de_cnpjs_unicos
    title: "Total de CNPJs Únicos"
    type: single_value
    explore: view_obt_estabelecimentos
    query:
      measures: [view_obt_estabelecimentos.count_distinct_cnpj]
      listen:
        data_de_inicio_da_atividade: view_obt_estabelecimentos.dt_inicio_atividade_date
        uf: view_obt_estabelecimentos.sg_uf
        situacao_cadastral: view_obt_estabelecimentos.ds_motivo_situacao_cadastral
    row: 0
    col: 6
    width: 6
    height: 3

  - name: estabelecimentos_por_uf
    title: "Estabelecimentos por UF"
    type: looker_google_map
    explore: view_obt_estabelecimentos
    query:
      dimensions: [view_obt_estabelecimentos.sg_uf]
      measures: [view_obt_estabelecimentos.count]
      sorts: [view_obt_estabelecimentos.count desc]
      limit: 500
      listen:
        data_de_inicio_da_atividade: view_obt_estabelecimentos.dt_inicio_atividade_date
        situacao_cadastral: view_obt_estabelecimentos.ds_motivo_situacao_cadastral
    row: 3
    col: 0
    width: 12
    height: 6

  - name: top_10_municipios
    title: "Top 10 Municípios por Nº de Estabelecimentos"
    type: looker_bar
    explore: view_obt_estabelecimentos
    query:
      dimensions: [view_obt_estabelecimentos.nm_municipio]
      measures: [view_obt_estabelecimentos.count]
      sorts: [view_obt_estabelecimentos.count desc]
      limit: 10
      listen:
        data_de_inicio_da_atividade: view_obt_estabelecimentos.dt_inicio_atividade_date
        uf: view_obt_estabelecimentos.sg_uf
        situacao_cadastral: view_obt_estabelecimentos.ds_motivo_situacao_cadastral
    row: 3
    col: 12
    width: 12
    height: 6

  - name: distribuicao_por_situacao_cadastral
    title: "Distribuição por Situação Cadastral"
    type: looker_pie
    explore: view_obt_estabelecimentos
    query:
      dimensions: [view_obt_estabelecimentos.ds_motivo_situacao_cadastral]
      measures: [view_obt_estabelecimentos.count]
      sorts: [view_obt_estabelecimentos.count desc]
      limit: 10
      listen:
        data_de_inicio_da_atividade: view_obt_estabelecimentos.dt_inicio_atividade_date
        uf: view_obt_estabelecimentos.sg_uf
    row: 9
    col: 0
    width: 12
    height: 6

  - name: novos_estabelecimentos_por_ano
    title: "Novos Estabelecimentos por Ano de Início da Atividade"
    type: looker_line
    explore: view_obt_estabelecimentos
    query:
      dimensions: [view_obt_estabelecimentos.dt_inicio_atividade_year]
      measures: [view_obt_estabelecimentos.count]
      sorts: [view_obt_estabelecimentos.dt_inicio_atividade_year desc]
      listen:
        uf: view_obt_estabelecimentos.sg_uf
        situacao_cadastral: view_obt_estabelecimentos.ds_motivo_situacao_cadastral
    row: 9
    col: 12
    width: 12
    height: 6