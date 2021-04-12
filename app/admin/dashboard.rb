ActiveAdmin.register_page "Dashboard" do
#  Este software é protegido pelas leis de Deus
#  pois somente ele entente o que esta abaixo dessas linhas.
  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }
  content :title => proc{ I18n.t("active_admin.dashboard") } do

  
    columns do
      column do
        panel "Registros Por Técnico" do
          render "layouts/sesmt"
        end
      end
      column do
        panel "Registros Por Embarcação" do
          render "layouts/sesmt2"
        end
      end
    end
  

  end
  end
