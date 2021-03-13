ActiveAdmin.register User do

menu :parent => "Cadastro", :if => proc{ current_user.superadmin? }
#permit_params :role_ids, :as => :admin
permit_params :name, :email, :password, :password_confirmation, :superadmin, :remember_me , :audio_mensagem, :audio_parada, :superusuario, :abastecimento_lvl, :attach_lvl, :anexo_lvl, :avaria_lvl, :balsa_lvl, :cliente_lvl, :controle_material_lvl, :controle_de_extintor_lvl, :embarque_lvl, :filial_lvl, :linha_lvl, :mensagem_lvl, :navio_lvl, :ordem_de_servico_lvl, :relatorio_quebra_lvl, :viagem_lvl, :user_lvl, :carregamento_lvl, :desembarque_lvl, :solicitante_lvl, :despesa_lvl, :centro_de_custo_lvl, :fornecedor_lvl, :despacho_lvl, :abastecimento_corporativo_lvl, :combustivel_lvl, :movimento_combustivel_lvl

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
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :controle_de_extintor_lvl
      f.input :superadmin
      f.input :superusuario
      f.input :audio_parada
      f.input :audio_mensagem
   end
    f.actions
  end  
end