# Define the database connection to be used for this model.
connection: "prototipando"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: govbr_bi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: govbr_bi_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Govbr Bi"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: view_obt_estabelecimentos {
  label: "Estabelecimentos"
  description: "Analisa estabelecimentos com informações de CNAE e localidades, sem exibir campos duplicados desnecessários."

  join: view_tb_cnaes {
    # label: "CNAE detalhado"
    type: left_outer
    sql_on: ${view_obt_estabelecimentos.cd_cnae_fiscal_principal} = ${view_tb_cnaes.id_classe} ;;
    relationship: many_to_one
    view_label: "CNAE"
    fields: [
      id_secao,
      ds_secao,
      id_divisao,
      ds_divisao,
      id_grupo,
      ds_grupo,
      id_classe,
      ds_classe,
      id_subclasse,
      ds_subclasse
    ]
  }

  join: view_tb_localidades {
    # label: "Localidade detalhada"
    type: left_outer
    sql_on: ${view_obt_estabelecimentos.cd_municipio} = ${view_tb_localidades.id_municipio} ;;
    relationship: many_to_one
    view_label: "Localidades"
    fields: [
      id_regiao,
      nm_regiao,
      sg_regiao,
      id_uf,
      nm_uf,
      sg_uf,
      id_mesorregiao,
      nm_mesorregiao,
      id_microrregiao,
      nm_microrregiao
    ]
  }
}
