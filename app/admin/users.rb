ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :name, :superadmin, :superusuario, :audio_parada, :audio_mensagem, :abastecimento_lvl, :attach_lvl, :anexo_lvl, :avaria_lvl, :balsa_lvl, :cliente_lvl, :controle_material_lvl, :controle_de_extintor_lvl, :embarque_lvl, :filial_lvl, :linha_lvl, :mensagem_lvl, :navio_lvl, :ordem_de_servico_lvl, :relatorio_quebra_lvl, :viagem_lvl, :user_lvl, :carregamento_lvl, :desembarque_lvl, :centro_de_custo_lvl, :solicitante_lvl, :despesa_lvl, :fornecedor_lvl, :despacho_lvl, :combustivel_lvl, :abastecimento_corporativo_lvl, :movimento_combustivel_lvl
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :name, :superadmin, :superusuario, :audio_parada, :audio_mensagem, :abastecimento_lvl, :attach_lvl, :anexo_lvl, :avaria_lvl, :balsa_lvl, :cliente_lvl, :controle_material_lvl, :controle_de_extintor_lvl, :embarque_lvl, :filial_lvl, :linha_lvl, :mensagem_lvl, :navio_lvl, :ordem_de_servico_lvl, :relatorio_quebra_lvl, :viagem_lvl, :user_lvl, :carregamento_lvl, :desembarque_lvl, :centro_de_custo_lvl, :solicitante_lvl, :despesa_lvl, :fornecedor_lvl, :despacho_lvl, :combustivel_lvl, :abastecimento_corporativo_lvl, :movimento_combustivel_lvl]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
