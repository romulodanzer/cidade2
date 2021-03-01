ActiveAdmin.register TipoRastreador do
  menu :parent => "Cadastro"
  permit_params :name
    actions :all, :except => :destroy


end
