ActiveAdmin.register Linha do
	menu :parent => "Cadastro", :if => proc{ current_user.superadmin? }   
	permit_params :name
end
