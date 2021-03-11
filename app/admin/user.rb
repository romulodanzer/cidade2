ActiveAdmin.register User do

menu :parent => "Cadastro", :if => proc{ current_user.superadmin? }
permit_params :role_ids, :as => :admin
permit_params :name, :email, :password, :password_confirmation, :superadmin, :remember_me , :audio_mensagem, :audio_parada, :superusuario, :abastecimento_lvl, :attach_lvl, :anexo_lvl, :avaria_lvl, :balsa_lvl, :cliente_lvl, :controle_material_lvl, :controle_de_extintor_lvl, :embarque_lvl, :filial_lvl, :linha_lvl, :mensagem_lvl, :navio_lvl, :ordem_de_servico_lvl, :relatorio_quebra_lvl, :viagem_lvl, :user_lvl, :carregamento_lvl, :desembarque_lvl, :solicitante_lvl, :despesa_lvl, :centro_de_custo_lvl, :fornecedor_lvl, :despacho_lvl, :abastecimento_corporativo_lvl#, :filial_ids

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
     # f.input :filial_ids
      f.input :email 
      f.input :password
      f.input :password_confirmation
      f.input :audio_mensagem, :label => "Audio para mensagem"
      #f.input :audio_parada, :label => "Audio por paradas"
      #f.input :superusuario, :label => "Cria e Edita tudo"
      f.input :superadmin, :label => "Super Administrator"
      f.inputs "Controle de Abastecimento" do
      f.inputs "Controle de Extintores" do
      f.input :controle_de_extintor_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Ver mensagens" do
      f.input :mensagem_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Cadastro de Navios" do
      f.input :navio_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
      f.inputs "Controle de Viagens" do
      f.input :viagem_lvl, :as => :radio, :collection => { "Sem Acesso" => 0, "Ver" => 1, "Ver e Criar" => 2, "Ver Criar e Atualizar" => 3 } 
      end
   end
    f.actions
  end  
end
end