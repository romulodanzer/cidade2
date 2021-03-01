ActiveAdmin.register User do

menu :parent => "Cadastro", :if => proc{ current_user.superadmin? }
  permit_params :name, :email, :password, :password_confirmation, :remember_me , :audio_mensagem, :audio_parada, :filial_ids, :superusuario, :abastecimento_lvl, :attach_lvl, :anexo_lvl, :avaria_lvl, :balsa_lvl, :cliente_lvl, :controle_material_lvl, :controle_de_extintor_lvl, :embarque_lvl, :filial_lvl, :linha_lvl, :mensagem_lvl, :navio_lvl, :ordem_de_servico_lvl, :relatorio_quebra_lvl, :viagem_lvl, :user_lvl, :carregamento_lvl, :desembarque_lvl, :solicitante_lvl, :despesa_lvl, :centro_de_custo_lvl, :fornecedor_lvl, :despacho_lvl, :abastecimento_corporativo_lvl, :movimento_combustivel_lvl

  index do
    column "Nome",:name
    #column :filial_id
    column :email
    #column "Logado por",:current_sign_in_at
    column "Ultima vez",:last_sign_in_at
    column "Total de Acessos",:sign_in_count
    #seller_column :superadmin
    actions
  end

   filter :email
   #filter :filiais 

  form do |f|
    f.inputs "User Details" do
      f.input :name, :label => "Nome"
      f.input :filiais, as: :check_boxes
      f.input :email 
      f.input :password
      f.input :password_confirmation
      f.input :audio_mensagem, :label => "Audio para mensagem"
      #f.input :audio_parada, :label => "Audio por paradas"
      #f.input :superusuario, :label => "Cria e Edita tudo"
      f.input :superadmin, :label => "Super Administrator"
      f.inputs "Controle de Abastecimento" do
      f.input :abastecimento_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }
      end
      f.inputs "Controle de Avarias" do
      f.input :avaria_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }
      end
      f.inputs "Cadastro de Balsas" do
      f.input :balsa_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Saida de Materiais" do
      f.input :controle_material_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Controle de Extintores" do
      f.input :controle_de_extintor_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Buscas e Indicadores de Embarque" do
      f.input :embarque_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Cadastro de Filiais" do
      f.input :filial_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Ver mensagens" do
      f.input :mensagem_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Cadastro de Navios" do
      f.input :navio_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Ordens de Servico" do
      f.input :ordem_de_servico_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Relatorio de Quebras" do
      f.input :relatorio_quebra_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Controle de Viagens" do
      f.input :viagem_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Controle de Carregamentos" do
      f.input :carregamento_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Controle de Desembarques" do
      f.input :desembarque_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end
      f.inputs "Cadastro de Clientes" do
      f.input :cliente_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end
      f.inputs "Cadastro de Centros de Custo" do
      f.input :centro_de_custo_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end
      f.inputs "Cadastro de Solicitantes de Despesa" do
      f.input :solicitante_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end
      f.inputs "Cadastro de Despesas" do
      f.input :despesa_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end
      f.inputs "Cadastro de Fornecedores" do
      f.input :fornecedor_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end
      f.inputs "Cadastro de Despachos" do
      f.input :despacho_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end
      f.inputs "Cadastro de Abastecimento Corporativo" do
      f.input :abastecimento_corporativo_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end      
      f.inputs "Cadastro Movimentos Chibatao" do
      f.input :movimento_combustivel_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 }  
      end      
    end
    f.actions
  end  
end