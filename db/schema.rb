# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210225140223) do

  create_table "AMENSAGENS", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "accountnumber"
    t.integer "navio_id"
    t.integer "grmn"
    t.integer "replygfmn"
    t.integer "externalsensoralarm"
    t.integer "msgpriority"
    t.integer "vehicleignition"
    t.integer "macronumber"
    t.integer "macroversion"
    t.integer "binarydatatype"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.datetime "positiontime"
    t.datetime "messagetime"
    t.string "landmark", collation: "utf8_general_ci"
    t.text "text", collation: "utf8_general_ci"
    t.integer "msgsubtype"
    t.string "msgtag", collation: "utf8_general_ci"
    t.string "temperaturei", collation: "utf8_general_ci"
    t.string "temperatureii", collation: "utf8_general_ci"
    t.string "rpm", collation: "utf8_general_ci"
    t.string "velocity", collation: "utf8_general_ci"
    t.boolean "done", default: false
    t.datetime "created_at", default: "2010-01-01 00:00:00"
    t.datetime "updated_at", default: "2010-01-01 00:00:00"
    t.boolean "sms"
    t.index ["msgsubtype"], name: "index_AMENSAGENS_on_msgsubtype"
    t.index ["navio_id"], name: "index_AMENSAGENS_on_navio_id"
    t.index ["navio_id"], name: "index_mensagens_on_navio_id"
  end

  create_table "APOSICOES", id: :integer, limit: 3, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "accountnumber"
    t.integer "navio_id"
    t.integer "externalsensoralarm"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.integer "vehicleignition"
    t.datetime "positiontime"
    t.string "landmark", collation: "utf8_general_ci"
    t.string "mctname", collation: "utf8_general_ci"
    t.datetime "created_at", default: "2010-01-01 00:00:00"
    t.datetime "updated_at", default: "2010-01-01 00:00:00"
    t.boolean "processada"
    t.float "distancia", limit: 24
    t.index ["navio_id"], name: "index_APOSICOES_on_navio_id"
  end

  create_table "abastecimentos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "navio_id"
    t.integer "tipo_de_rancho_id"
    t.integer "cadastro_de_fornecedor_id"
    t.datetime "data_ini"
    t.datetime "data_fim"
    t.float "hfo", limit: 24
    t.float "gasolina", limit: 24
    t.float "lubrificante", limit: 24
    t.float "diesel", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "valor", precision: 8, scale: 2
    t.integer "filial_id"
    t.integer "botija_de_gas"
    t.index ["cadastro_de_fornecedor_id"], name: "index_abastecimentos_on_cadastro_de_fornecedor_id"
    t.index ["navio_id"], name: "index_abastecimentos_on_navio_id"
    t.index ["tipo_de_rancho_id"], name: "index_abastecimentos_on_tipo_de_rancho_id"
  end

  create_table "active_admin_comments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "namespace"
    t.text "body"
    t.integer "resource_id"
    t.string "resource_type"
    t.integer "author_id"
    t.string "author_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users_filiais", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "filial_id"
    t.integer "admin_user_id"
    t.index ["filial_id", "admin_user_id"], name: "index_admin_users_filiais_on_filial_id_and_admin_user_id"
  end

  create_table "aliases", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.integer "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_configs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.boolean "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arquivos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "navio_id"
    t.integer "viagem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "anexo_file_name", collation: "utf8_general_ci"
    t.string "anexo_content_type", collation: "utf8_general_ci"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.index ["navio_id"], name: "index_arquivos_on_navio_id"
    t.index ["viagem_id"], name: "index_arquivos_on_viagem_id"
  end

  create_table "attaches", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name", collation: "utf8_general_ci"
    t.string "avatar_content_type", collation: "utf8_general_ci"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "avaria_id"
    t.string "descricao", collation: "utf8_general_ci"
    t.integer "ordem_de_servico_id"
    t.integer "despacho_id"
  end

  create_table "avarias", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "embarque_id"
    t.string "placa", collation: "utf8_general_ci"
    t.string "cliente", collation: "utf8_general_ci"
    t.string "trecho", collation: "utf8_general_ci"
    t.integer "filial_id"
    t.text "descricao", collation: "utf8_general_ci"
    t.text "envolvidos", collation: "utf8_general_ci"
    t.string "ocorrencia_file_name", collation: "utf8_general_ci"
    t.string "ocorrencia_content_type", collation: "utf8_general_ci"
    t.integer "ocorrencia_file_size"
    t.datetime "ocorrencia_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "navio_id"
    t.integer "balsa_id"
    t.date "data"
    t.integer "tipo_avaria_id"
    t.string "status", collation: "utf8_general_ci"
    t.decimal "valor", precision: 8, scale: 2, default: "0.0"
    t.boolean "desc_funcionario", default: false
    t.string "assunto", default: "", collation: "utf8_general_ci"
    t.index ["embarque_id"], name: "index_avarias_on_embarque_id"
    t.index ["filial_id"], name: "index_avarias_on_filial_id"
  end

  create_table "balsas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "imo"
    t.decimal "tonelagem_bruta", precision: 10
    t.decimal "comprimento", precision: 10
    t.decimal "largura", precision: 10
    t.decimal "calado", precision: 10
    t.decimal "arquiacao", precision: 10
    t.integer "capacidade"
    t.integer "balsaid"
    t.date "casc_e_est_validade_total"
    t.date "casc_e_est_classificacao_inicial"
    t.date "casc_e_est_manutencao_de_classe_mc1_abertura"
    t.date "casc_e_est_manutencao_de_classe_mc1_fechamento"
    t.date "casc_e_est_manutencao_de_classe_mc1_realizado"
    t.string "casc_e_est_manutencao_de_classe_mc1_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_manutencao_de_classe_mc1_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_manutencao_de_classe_mc1_anexo_file_size"
    t.datetime "casc_e_est_manutencao_de_classe_mc1_anexo_updated_at"
    t.date "casc_e_est_manutencao_de_classe_mc2_abertura"
    t.date "casc_e_est_manutencao_de_classe_mc2_fechamento"
    t.date "casc_e_est_manutencao_de_classe_mc2_realizado"
    t.string "casc_e_est_manutencao_de_classe_mc2_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_manutencao_de_classe_mc2_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_manutencao_de_classe_mc2_anexo_file_size"
    t.datetime "casc_e_est_manutencao_de_classe_mc2_anexo_updated_at"
    t.date "casc_e_est_manutencao_de_classe_mc3_abertura"
    t.date "casc_e_est_manutencao_de_classe_mc3_fechamento"
    t.date "casc_e_est_manutencao_de_classe_mc3_realizado"
    t.string "casc_e_est_manutencao_de_classe_mc3_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_manutencao_de_classe_mc3_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_manutencao_de_classe_mc3_anexo_file_size"
    t.datetime "casc_e_est_manutencao_de_classe_mc3_anexo_updated_at"
    t.date "casc_e_est_renovacao_de_classe_abertura"
    t.date "casc_e_est_renovacao_de_classe_fechamento"
    t.date "casc_e_est_renovacao_de_classe_realizado"
    t.string "casc_e_est_renovacao_de_classe_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_renovacao_de_classe_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_renovacao_de_classe_anexo_file_size"
    t.datetime "casc_e_est_renovacao_de_classe_anexo_updated_at"
  end

  create_table "balsas_cargas_web_viagens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "balsas_cargas_web_id"
    t.integer "viagem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "balsas_cargas_webs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boia", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "embarcacao"
    t.string "modelo"
    t.string "fabricante"
    t.string "fabricacao"
    t.string "n_de_serie"
    t.string "classe"
    t.string "corda_salva_vidas"
    t.string "cordas_retinida"
    t.string "fita_refletiva"
    t.string "bujao"
    t.string "tecnico"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo"
    t.string "identificacao_rebocador"
    t.string "observacao"
    t.string "foto"
    t.text "responsavel_pela_embarcacao"
    t.text "tipo_de_embarcacao"
    t.text "localizacao"
    t.date "validade"
  end

  create_table "carregamentos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "balsa_id"
    t.integer "navio_id"
    t.datetime "inicio"
    t.datetime "fim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "parado", limit: 24
    t.float "produzido", limit: 24
    t.float "total", limit: 24
    t.integer "carretas"
    t.string "anexo_file_name", collation: "utf8_general_ci"
    t.string "anexo_content_type", collation: "utf8_general_ci"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.integer "viagem_id"
    t.string "name", collation: "utf8_general_ci"
    t.integer "filial_id"
    t.string "inspecao_file_name", collation: "utf8_general_ci"
    t.string "inspecao_content_type", collation: "utf8_general_ci"
    t.integer "inspecao_file_size"
    t.datetime "inspecao_updated_at"
    t.integer "motoristas"
    t.integer "container20"
    t.integer "container40"
    t.index ["balsa_id"], name: "index_carregamentos_on_balsa_id"
    t.index ["navio_id"], name: "index_carregamentos_on_navio_id"
  end

  create_table "carregamentos_paradas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "carregamento_id"
    t.integer "parada_id"
  end

  create_table "carregamentos_viagens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "carregamento_id"
    t.integer "viagem_id"
  end

  create_table "controle_de_extintors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "embarcacao"
    t.string "numero_do_registro"
    t.string "tipo"
    t.string "capacidade"
    t.date "proxima_recarga"
    t.string "mangueira"
    t.string "difusor"
    t.string "manometro"
    t.string "gatilho"
    t.string "lacre"
    t.string "descarregado"
    t.string "trava"
    t.string "piso"
    t.string "placa"
    t.text "observacao"
    t.string "setor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numero_interno"
    t.string "tecnico"
    t.string "foto"
    t.text "tipo_de_embarcacao"
    t.text "fabricante"
  end

  create_table "delayed_jobs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "progress_stage"
    t.integer "progress_current", default: 0
    t.integer "progress_max", default: 0
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "desempenhos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "trecho_id"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.integer "percentual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trecho_id"], name: "index_desempenhos_on_trecho_id"
  end

  create_table "despachos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "navio_id"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["navio_id"], name: "index_despachos_on_navio_id"
  end

  create_table "embarques", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "empurrador", collation: "utf8_general_ci"
    t.string "sbalsa", collation: "utf8_general_ci"
    t.string "trecho", collation: "utf8_general_ci"
    t.string "placa", collation: "utf8_general_ci"
    t.string "tipo", collation: "utf8_general_ci"
    t.string "cliente", collation: "utf8_general_ci"
    t.datetime "entrada"
    t.datetime "saida"
    t.datetime "chegada"
    t.string "desembarque", collation: "utf8_general_ci"
    t.string "cnpj", collation: "utf8_general_ci"
    t.string "obs", collation: "utf8_general_ci"
    t.integer "navioid"
    t.integer "balsaid"
    t.integer "viagemid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "tempopatio", precision: 8
    t.string "carga", collation: "utf8_general_ci"
    t.datetime "entrada_doc"
    t.datetime "inicio_presenca"
    t.datetime "fim_presenca"
    t.string "email", collation: "utf8_general_ci"
    t.string "chave_aqua", collation: "utf8_general_ci"
    t.integer "viagem_id"
    t.string "rastreio", collation: "utf8_general_ci"
    t.decimal "peso", precision: 8, scale: 2, default: "0.0"
    t.index ["cliente"], name: "index_embarques_on_cliente"
    t.index ["cnpj"], name: "index_embarques_on_cnpj"
    t.index ["empurrador"], name: "index_embarques_on_empurrador"
    t.index ["entrada"], name: "index_embarques_on_entrada"
    t.index ["placa"], name: "index_embarques_on_placa"
    t.index ["rastreio"], name: "index_embarques_on_rastreio", unique: true
    t.index ["viagem_id"], name: "index_embarques_on_viagem_id"
  end

  create_table "filiais", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.string "fone", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "meta_de_carregamento"
    t.integer "meta_de_desembarque"
    t.integer "capacidade_do_patio"
    t.string "prefixo_trecho", collation: "utf8_general_ci"
    t.decimal "preco_diesel", precision: 8, scale: 2
    t.decimal "preco_hfo", precision: 8, scale: 2
    t.decimal "preco_botija_de_gas", precision: 8, scale: 2
    t.decimal "preco_gasolina", precision: 8, scale: 2
    t.decimal "preco_lubrificante", precision: 8, scale: 2
  end

  create_table "filiais_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "filial_id"
    t.integer "user_id"
  end

  create_table "hidrantes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "localizacao"
    t.string "sinalizacao_e_demarcacao"
    t.string "pintura"
    t.string "valvula_e_vedacao"
    t.string "conexao"
    t.string "tampoes"
    t.string "conservacao_e_limpeza"
    t.string "chaves_storz"
    t.string "esguichos"
    t.string "fabricante"
    t.string "responsavel_embarcacao"
    t.string "tecnico"
    t.string "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "embarcacao"
    t.string "estado_geral"
    t.text "foto"
  end

  create_table "inspecaos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linhas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mangueiras", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "embarcacao"
    t.string "localizacao"
    t.string "fabricante"
    t.date "fabricacao"
    t.date "teste_hidrostatico"
    t.string "comprimento"
    t.string "diametro"
    t.string "tipo"
    t.string "acoplamentos"
    t.string "anel_de_vedacao"
    t.string "acondicionada_e_aduchada"
    t.string "estado_de_conservacao"
    t.string "responsavel_pela_embarcacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tecnico"
    t.string "observacao"
    t.string "foto"
  end

  create_table "material_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monkeys", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "navios", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.integer "linha_id"
    t.boolean "rpm_config", default: false
    t.integer "rpm_min"
    t.integer "rpm_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name", collation: "utf8_general_ci"
    t.string "avatar_content_type", collation: "utf8_general_ci"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "relatorio_de_radio"
    t.boolean "cameras"
    t.date "cam_ini"
    t.date "cam_fim"
    t.boolean "gps"
    t.boolean "bastao"
    t.boolean "ais_confirm"
    t.string "mmsi", collation: "utf8_general_ci"
    t.string "call_sign", collation: "utf8_general_ci"
    t.boolean "camera_integrada"
    t.string "codigos_siget", collation: "utf8_general_ci"
    t.integer "potencia"
    t.integer "ab"
    t.integer "al"
    t.decimal "pb", precision: 10
    t.decimal "comprimento", precision: 10
    t.decimal "boca", precision: 10
    t.decimal "pontal", precision: 10
    t.decimal "calado", precision: 10
    t.decimal "cts_min", precision: 10
    t.decimal "cts_max", precision: 10
    t.integer "imo"
    t.date "casc_e_est_validade_total"
    t.date "casc_e_est_classificacao_inicial"
    t.date "casc_e_est_manutencao_de_classe_mc1_abertura"
    t.date "casc_e_est_manutencao_de_classe_mc1_fechamento"
    t.date "casc_e_est_manutencao_de_classe_mc1_realizado"
    t.string "casc_e_est_manutencao_de_classe_mc1_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_manutencao_de_classe_mc1_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_manutencao_de_classe_mc1_anexo_file_size"
    t.datetime "casc_e_est_manutencao_de_classe_mc1_anexo_updated_at"
    t.date "casc_e_est_manutencao_de_classe_mc2_abertura"
    t.date "casc_e_est_manutencao_de_classe_mc2_fechamento"
    t.date "casc_e_est_manutencao_de_classe_mc2_realizado"
    t.string "casc_e_est_manutencao_de_classe_mc2_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_manutencao_de_classe_mc2_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_manutencao_de_classe_mc2_anexo_file_size"
    t.datetime "casc_e_est_manutencao_de_classe_mc2_anexo_updated_at"
    t.date "casc_e_est_manutencao_de_classe_mc3_abertura"
    t.date "casc_e_est_manutencao_de_classe_mc3_fechamento"
    t.date "casc_e_est_manutencao_de_classe_mc3_realizado"
    t.string "casc_e_est_manutencao_de_classe_mc3_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_manutencao_de_classe_mc3_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_manutencao_de_classe_mc3_anexo_file_size"
    t.datetime "casc_e_est_manutencao_de_classe_mc3_anexo_updated_at"
    t.date "casc_e_est_renovacao_de_classe_abertura"
    t.date "casc_e_est_renovacao_de_classe_fechamento"
    t.date "casc_e_est_renovacao_de_classe_realizado"
    t.string "casc_e_est_renovacao_de_classe_anexo_file_name", collation: "utf8_general_ci"
    t.string "casc_e_est_renovacao_de_classe_anexo_content_type", collation: "utf8_general_ci"
    t.integer "casc_e_est_renovacao_de_classe_anexo_file_size"
    t.datetime "casc_e_est_renovacao_de_classe_anexo_updated_at"
    t.integer "tipo_rastreador_id"
    t.string "codigo_rastreador", collation: "utf8_general_ci"
    t.integer "filial_id"
    t.string "status", collation: "utf8_general_ci"
    t.index ["linha_id"], name: "index_navios_on_linha_id"
  end

  create_table "notitications", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action", collation: "utf8_general_ci"
    t.integer "notifiable_id"
    t.string "notifiable_type", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordem_de_servicos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "filial_id"
    t.date "data"
    t.integer "navio_id"
    t.text "solicitacao", collation: "utf8_general_ci"
    t.text "diagnostico", collation: "utf8_general_ci"
    t.text "causa", collation: "utf8_general_ci"
    t.string "relator", collation: "utf8_general_ci"
    t.string "testemunha", collation: "utf8_general_ci"
    t.string "avaliacao", collation: "utf8_general_ci"
    t.text "detalhamento_da_conclusao", collation: "utf8_general_ci"
    t.boolean "embarcacao_socorrida"
    t.integer "tipo_socorro_id"
    t.string "status", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ResponsavelSolicitacao_id"
    t.integer "user_id"
    t.date "prazo"
    t.string "local", collation: "utf8_general_ci"
    t.string "tipo", collation: "utf8_general_ci"
    t.string "foto1", collation: "utf8_general_ci"
    t.string "foto2", collation: "utf8_general_ci"
    t.string "foto3", collation: "utf8_general_ci"
    t.string "foto4", collation: "utf8_general_ci"
    t.string "audio", collation: "utf8_general_ci"
    t.integer "balsa_id"
    t.datetime "inicio_servico"
    t.datetime "fim_servico"
    t.string "tecnico1", collation: "utf8_general_ci"
    t.string "tecnico2", collation: "utf8_general_ci"
    t.string "tecnico3", collation: "utf8_general_ci"
    t.string "tecnico4", collation: "utf8_general_ci"
    t.index ["filial_id"], name: "index_ordem_de_servicos_on_filial_id"
    t.index ["navio_id"], name: "index_ordem_de_servicos_on_navio_id"
    t.index ["tipo_socorro_id"], name: "index_ordem_de_servicos_on_tipo_socorro_id"
  end

  create_table "paradas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "trecho_id"
    t.datetime "inicio"
    t.datetime "fim"
    t.integer "razao_id"
    t.float "total", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "filial_id"
    t.index ["razao_id"], name: "index_paradas_on_razao_id"
    t.index ["trecho_id"], name: "index_paradas_on_trecho_id"
  end

  create_table "pesquisas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "cacl"
    t.boolean "SegAtoSeguro"
    t.boolean "SegFormaSatisfatoria"
    t.boolean "SegAptoUso"
    t.boolean "OperDrenagem"
    t.boolean "OperInspEficiente"
    t.boolean "Manut"
    t.boolean "NavDocSol"
    t.boolean "NavSeguro"
    t.boolean "NavHora"
    t.string "ResTripulant"
    t.string "ResOperFinal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avaliador"
  end

  create_table "responsavel_solicitacoes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fone", collation: "utf8_general_ci"
  end

  create_table "seguranca_da_navegacao_certificados", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "navio_id"
    t.integer "balsa_id"
    t.date "validade_total"
    t.date "vistoria_intermediaria_de_casco_abertura"
    t.date "vistoria_intermediaria_de_casco_fechamento"
    t.date "vistoria_intermediaria_de_casco_realizado"
    t.string "vistoria_intermediaria_de_casco_anexo_file_name", collation: "utf8_general_ci"
    t.string "vistoria_intermediaria_de_casco_anexo_content_type", collation: "utf8_general_ci"
    t.integer "vistoria_intermediaria_de_casco_anexo_file_size"
    t.datetime "vistoria_intermediaria_de_casco_anexo_updated_at"
    t.date "prim_vistoria_intermediaria_de_maquinas_abertura"
    t.date "prim_vistoria_intermediaria_de_maquinas_fechamento"
    t.date "prim_vistoria_intermediaria_de_maquinas_realizado"
    t.string "prim_vistoria_intermediaria_de_maquinas_anexo_file_name", collation: "utf8_general_ci"
    t.string "prim_vistoria_intermediaria_de_maquinas_anexo_content_type", collation: "utf8_general_ci"
    t.integer "prim_vistoria_intermediaria_de_maquinas_anexo_file_size"
    t.datetime "prim_vistoria_intermediaria_de_maquinas_anexo_updated_at"
    t.date "seg_vistoria_intermediaria_de_maquinas_abertura"
    t.string "seg_vistoria_intermediaria_de_maquinas_fechamento", collation: "utf8_general_ci"
    t.date "seg_vistoria_intermediaria_de_maquinas_realizado"
    t.string "seg_vistoria_intermediaria_de_maquinas_anexo_file_name", collation: "utf8_general_ci"
    t.string "seg_vistoria_intermediaria_de_maquinas_anexo_content_type", collation: "utf8_general_ci"
    t.integer "seg_vistoria_intermediaria_de_maquinas_anexo_file_size"
    t.datetime "seg_vistoria_intermediaria_de_maquinas_anexo_updated_at"
    t.date "prim_vistoria_intermediaria_de_eletricidade_abertura"
    t.date "prim_vistoria_intermediaria_de_eletricidade_fechamento"
    t.date "prim_vistoria_intermediaria_de_eletricidade_realizado"
    t.string "prim_vistoria_intermediaria_de_eletricidade_anexo_file_name", collation: "utf8_general_ci"
    t.string "prim_vistoria_intermediaria_de_eletricidade_anexo_content_type", collation: "utf8_general_ci"
    t.integer "prim_vistoria_intermediaria_de_eletricidade_anexo_file_size"
    t.datetime "prim_vistoria_intermediaria_de_eletricidade_anexo_updated_at"
    t.date "seg_vistoria_intermediaria_de_eletricidade_abertura"
    t.date "seg_vistoria_intermediaria_de_eletricidade_fechamento"
    t.date "seg_vistoria_intermediaria_de_eletricidade_realizado"
    t.string "seg_vistoria_intermediaria_de_eletricidade_anexo_file_name", collation: "utf8_general_ci"
    t.string "seg_vistoria_intermediaria_de_eletricidade_anexo_content_type", collation: "utf8_general_ci"
    t.integer "seg_vistoria_intermediaria_de_eletricidade_anexo_file_size"
    t.datetime "seg_vistoria_intermediaria_de_eletricidade_anexo_updated_at"
    t.date "prim_vistoria_intermediaria_de_equipamentos_abertura"
    t.date "prim_vistoria_intermediaria_de_equipamentos_fechamento"
    t.date "prim_vistoria_intermediaria_de_equipamentos_realizado"
    t.string "prim_vistoria_intermediaria_de_equipamentos_anexo_file_name", collation: "utf8_general_ci"
    t.string "prim_vistoria_intermediaria_de_equipamentos_anexo_content_type", collation: "utf8_general_ci"
    t.integer "prim_vistoria_intermediaria_de_equipamentos_anexo_file_size"
    t.datetime "prim_vistoria_intermediaria_de_equipamentos_anexo_updated_at"
    t.date "seg_vistoria_intermediaria_de_equipamentos_abertura"
    t.date "seg_vistoria_intermediaria_de_equipamentos_fechamento"
    t.date "seg_vistoria_intermediaria_de_equipamentos_realizado"
    t.string "seg_vistoria_intermediaria_de_equipamentos_anexo_file_name", collation: "utf8_general_ci"
    t.string "seg_vistoria_intermediaria_de_equipamentos_anexo_content_type", collation: "utf8_general_ci"
    t.integer "seg_vistoria_intermediaria_de_equipamentos_anexo_file_size"
    t.datetime "seg_vistoria_intermediaria_de_equipamentos_anexo_updated_at"
    t.date "terc_vistoria_intermediaria_de_equipamentos_abertura"
    t.date "terc_vistoria_intermediaria_de_equipamentos_fechamento"
    t.date "terc_vistoria_intermediaria_de_equipamentos_realizado"
    t.string "terc_vistoria_intermediaria_de_equipamentos_anexo_file_name", collation: "utf8_general_ci"
    t.string "terc_vistoria_intermediaria_de_equipamentos_anexo_content_type", collation: "utf8_general_ci"
    t.integer "terc_vistoria_intermediaria_de_equipamentos_anexo_file_size"
    t.datetime "terc_vistoria_intermediaria_de_equipamentos_anexo_updated_at"
    t.date "prim_vistoria_intermediaria_de_radio_abertura"
    t.date "prim_vistoria_intermediaria_de_radio_fechamento"
    t.date "prim_vistoria_intermediaria_de_radio_realizado"
    t.string "prim_vistoria_intermediaria_de_radio_anexo_file_name", collation: "utf8_general_ci"
    t.string "prim_vistoria_intermediaria_de_radio_anexo_content_type", collation: "utf8_general_ci"
    t.integer "prim_vistoria_intermediaria_de_radio_anexo_file_size"
    t.datetime "prim_vistoria_intermediaria_de_radio_anexo_updated_at"
    t.date "seg_vistoria_intermediaria_de_radio_abertura"
    t.date "seg_vistoria_intermediaria_de_radio_fechamento"
    t.date "seg_vistoria_intermediaria_de_radio_realizado"
    t.string "seg_vistoria_intermediaria_de_radio_anexo_file_name", collation: "utf8_general_ci"
    t.string "seg_vistoria_intermediaria_de_radio_anexo_content_type", collation: "utf8_general_ci"
    t.integer "seg_vistoria_intermediaria_de_radio_anexo_file_size"
    t.datetime "seg_vistoria_intermediaria_de_radio_anexo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["balsa_id"], name: "index_seguranca_da_navegacao_certificados_on_balsa_id"
    t.index ["navio_id"], name: "index_seguranca_da_navegacao_certificados_on_navio_id"
  end

  create_table "tecnicos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_avarias", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_de_ranchos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.string "operacao", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_rastreadors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_socorros", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "nome", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titulo_de_inscricoes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date "emissao"
    t.integer "navio_id"
    t.string "anexo_file_name", collation: "utf8_general_ci"
    t.string "anexo_content_type", collation: "utf8_general_ci"
    t.integer "anexo_file_size"
    t.datetime "anexo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "balsa_id"
    t.index ["navio_id"], name: "index_titulo_de_inscricoes_on_navio_id"
  end

  create_table "trechos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "destino", collation: "utf8_general_ci"
    t.decimal "tempo_padrao", precision: 10
    t.decimal "meta", precision: 10
    t.integer "filial_id"
  end

  create_table "unloadings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "navio_id"
    t.datetime "inicio"
    t.integer "balsa_id"
    t.datetime "fim"
    t.float "total", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "filial_id"
    t.integer "user_id"
    t.boolean "pendente"
    t.integer "viagem_id"
    t.integer "carregamento_id"
    t.index ["balsa_id"], name: "index_unloadings_on_balsa_id"
    t.index ["navio_id"], name: "index_unloadings_on_navio_id"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "email", default: "", null: false, collation: "utf8_general_ci"
    t.string "encrypted_password", default: "", null: false, collation: "utf8_general_ci"
    t.string "reset_password_token", collation: "utf8_general_ci"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", collation: "utf8_general_ci"
    t.string "last_sign_in_ip", collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", collation: "utf8_general_ci"
    t.boolean "superadmin", default: false, null: false
    t.boolean "superusuario", default: false
    t.boolean "audio_parada", default: false
    t.boolean "audio_mensagem", default: false
    t.integer "abastecimento_lvl", default: 0
    t.integer "attach_lvl", default: 0
    t.integer "anexo_lvl", default: 0
    t.integer "avaria_lvl", default: 0
    t.integer "balsa_lvl", default: 0
    t.integer "cliente_lvl", default: 0
    t.integer "controle_material_lvl", default: 0
    t.integer "controle_de_extintor_lvl", default: 0
    t.integer "embarque_lvl", default: 0
    t.integer "filial_lvl", default: 0
    t.integer "linha_lvl", default: 0
    t.integer "mensagem_lvl", default: 0
    t.integer "navio_lvl", default: 0
    t.integer "ordem_de_servico_lvl", default: 0
    t.integer "relatorio_quebra_lvl", default: 0
    t.integer "viagem_lvl", default: 0
    t.integer "user_lvl", default: 0
    t.integer "carregamento_lvl", default: 0
    t.integer "desembarque_lvl", default: 0
    t.integer "centro_de_custo_lvl"
    t.integer "solicitante_lvl", default: 0
    t.integer "despesa_lvl", default: 0
    t.integer "fornecedor_lvl"
    t.integer "despacho_lvl"
    t.integer "combustivel_lvl"
    t.integer "abastecimento_corporativo_lvl"
    t.integer "movimento_combustivel_lvl", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "item_type", limit: 191, null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "viagens", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "navio_id"
    t.integer "trecho_id"
    t.datetime "inicio_viagem"
    t.datetime "fim_viagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mapa_de_conves_file_name", collation: "utf8_general_ci"
    t.string "mapa_de_conves_content_type", collation: "utf8_general_ci"
    t.integer "mapa_de_conves_file_size"
    t.datetime "mapa_de_conves_updated_at"
    t.string "inventario_file_name", collation: "utf8_general_ci"
    t.string "inventario_content_type", collation: "utf8_general_ci"
    t.integer "inventario_file_size"
    t.datetime "inventario_updated_at"
    t.datetime "previsao"
    t.string "mapa_de_conves2_file_name", collation: "utf8_general_ci"
    t.string "mapa_de_conves2_content_type", collation: "utf8_general_ci"
    t.integer "mapa_de_conves2_file_size"
    t.datetime "mapa_de_conves2_updated_at"
    t.string "mapa_de_conves3_file_name", collation: "utf8_general_ci"
    t.string "mapa_de_conves3_content_type", collation: "utf8_general_ci"
    t.integer "mapa_de_conves3_file_size"
    t.datetime "mapa_de_conves3_updated_at"
    t.string "siget", collation: "utf8_general_ci"
    t.decimal "tempo", precision: 8
    t.string "mapa_de_conves4_file_name", collation: "utf8_general_ci"
    t.string "mapa_de_conves4_content_type", collation: "utf8_general_ci"
    t.integer "mapa_de_conves4_file_size"
    t.datetime "mapa_de_conves4_updated_at"
    t.decimal "atraso", precision: 8
    t.boolean "email_enviado", default: false
    t.index ["navio_id"], name: "index_viagens_on_navio_id"
    t.index ["trecho_id"], name: "index_viagens_on_trecho_id"
  end

  create_table "viagens_cargas_webs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vistoria", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "navio_id"
    t.date "data"
    t.string "banheiro_inferior_1_file_name", collation: "utf8_general_ci"
    t.string "banheiro_inferior_1_content_type", collation: "utf8_general_ci"
    t.integer "banheiro_inferior_1_file_size"
    t.datetime "banheiro_inferior_1_updated_at"
    t.string "banheiro_inferior_2_file_name", collation: "utf8_general_ci"
    t.string "banheiro_inferior_2_content_type", collation: "utf8_general_ci"
    t.integer "banheiro_inferior_2_file_size"
    t.datetime "banheiro_inferior_2_updated_at"
    t.string "camarote_inferior_1_file_name", collation: "utf8_general_ci"
    t.string "camarote_inferior_1_content_type", collation: "utf8_general_ci"
    t.integer "camarote_inferior_1_file_size"
    t.datetime "camarote_inferior_1_updated_at"
    t.string "camarote_inferior_2_file_name", collation: "utf8_general_ci"
    t.string "camarote_inferior_2_content_type", collation: "utf8_general_ci"
    t.integer "camarote_inferior_2_file_size"
    t.datetime "camarote_inferior_2_updated_at"
    t.string "camamote_inferior_3_file_name", collation: "utf8_general_ci"
    t.string "camamote_inferior_3_content_type", collation: "utf8_general_ci"
    t.integer "camamote_inferior_3_file_size"
    t.datetime "camamote_inferior_3_updated_at"
    t.string "camarote_inferior_4_file_name", collation: "utf8_general_ci"
    t.string "camarote_inferior_4_content_type", collation: "utf8_general_ci"
    t.integer "camarote_inferior_4_file_size"
    t.datetime "camarote_inferior_4_updated_at"
    t.string "camarote_superior_1_file_name", collation: "utf8_general_ci"
    t.string "camarote_superior_1_content_type", collation: "utf8_general_ci"
    t.integer "camarote_superior_1_file_size"
    t.datetime "camarote_superior_1_updated_at"
    t.string "camarote_superior_2_file_name", collation: "utf8_general_ci"
    t.string "camarote_superior_2_content_type", collation: "utf8_general_ci"
    t.integer "camarote_superior_2_file_size"
    t.datetime "camarote_superior_2_updated_at"
    t.string "camarote_superior_3_file_name", collation: "utf8_general_ci"
    t.string "camarote_superior_3_content_type", collation: "utf8_general_ci"
    t.integer "camarote_superior_3_file_size"
    t.datetime "camarote_superior_3_updated_at"
    t.string "camarote_superior_4_file_name", collation: "utf8_general_ci"
    t.string "camarote_superior_4_content_type", collation: "utf8_general_ci"
    t.integer "camarote_superior_4_file_size"
    t.datetime "camarote_superior_4_updated_at"
    t.string "cozinha_1_file_name", collation: "utf8_general_ci"
    t.string "cozinha_1_content_type", collation: "utf8_general_ci"
    t.integer "cozinha_1_file_size"
    t.datetime "cozinha_1_updated_at"
    t.string "cozinha_2_file_name", collation: "utf8_general_ci"
    t.string "cozinha_2_content_type", collation: "utf8_general_ci"
    t.integer "cozinha_2_file_size"
    t.datetime "cozinha_2_updated_at"
    t.string "sala_de_maquinas_1_file_name", collation: "utf8_general_ci"
    t.string "sala_de_maquinas_1_content_type", collation: "utf8_general_ci"
    t.integer "sala_de_maquinas_1_file_size"
    t.datetime "sala_de_maquinas_1_updated_at"
    t.string "sala_de_maquinas_2_file_name", collation: "utf8_general_ci"
    t.string "sala_de_maquinas_2_content_type", collation: "utf8_general_ci"
    t.integer "sala_de_maquinas_2_file_size"
    t.datetime "sala_de_maquinas_2_updated_at"
    t.string "sala_de_maquinas_3_file_name", collation: "utf8_general_ci"
    t.string "sala_de_maquinas_3_content_type", collation: "utf8_general_ci"
    t.integer "sala_de_maquinas_3_file_size"
    t.datetime "sala_de_maquinas_3_updated_at"
    t.string "sala_de_maquinas_4_file_name", collation: "utf8_general_ci"
    t.string "sala_de_maquinas_4_content_type", collation: "utf8_general_ci"
    t.integer "sala_de_maquinas_4_file_size"
    t.datetime "sala_de_maquinas_4_updated_at"
    t.string "equipamento_do_comando_1_file_name", collation: "utf8_general_ci"
    t.string "equipamento_do_comando_1_content_type", collation: "utf8_general_ci"
    t.integer "equipamento_do_comando_1_file_size"
    t.datetime "equipamento_do_comando_1_updated_at"
    t.string "equipamento_do_comando_2_file_name", collation: "utf8_general_ci"
    t.string "equipamento_do_comando_2_content_type", collation: "utf8_general_ci"
    t.integer "equipamento_do_comando_2_file_size"
    t.datetime "equipamento_do_comando_2_updated_at"
    t.string "equipamento_do_comando_3_file_name", collation: "utf8_general_ci"
    t.string "equipamento_do_comando_3_content_type", collation: "utf8_general_ci"
    t.integer "equipamento_do_comando_3_file_size"
    t.datetime "equipamento_do_comando_3_updated_at"
    t.string "equipamento_do_comando_4_file_name", collation: "utf8_general_ci"
    t.string "equipamento_do_comando_4_content_type", collation: "utf8_general_ci"
    t.integer "equipamento_do_comando_4_file_size"
    t.datetime "equipamento_do_comando_4_updated_at"
    t.string "pintura_externa_1_file_name", collation: "utf8_general_ci"
    t.string "pintura_externa_1_content_type", collation: "utf8_general_ci"
    t.integer "pintura_externa_1_file_size"
    t.datetime "pintura_externa_1_updated_at"
    t.string "pintura_externa_2_file_name", collation: "utf8_general_ci"
    t.string "pintura_externa_2_content_type", collation: "utf8_general_ci"
    t.integer "pintura_externa_2_file_size"
    t.datetime "pintura_externa_2_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["navio_id"], name: "index_vistoria_on_navio_id"
  end

  create_table "webcargas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "IdCargasWEB"
    t.integer "IdGestoSat"
    t.integer "CodigoRastreador"
    t.string "NomeEmpurrador"
  end

end
