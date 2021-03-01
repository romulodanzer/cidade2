class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.superadmin?
       can :manage, :all
        else
                  #todos para dashboard e anexo
                   can :read, ActiveAdmin::Page, :name => "Dashboard"
                   can :manage, Anexo
                   can :manage, ActiveAdminComment
                   can :manage, Attach
                   #fim de dashboard e anexos

                  #inicio de balsa
                  can :read, Balsa if user.balsa_lvl >= 1
                  can :create, Balsa if user.balsa_lvl >= 2
                  can :update, Balsa if user.balsa_lvl >= 3
                  #fim de balsa

                  #controles do sesmt
                  can :read, Pesquisa if user.controle_de_extintor_lvl >= 1
                  can :read, ControleDeExtintor if user.controle_de_extintor_lvl >= 1
                  can :create, ControleDeExtintor if user.controle_de_extintor_lvl >= 2
                  can :manage, ControleDeExtintor if user.controle_de_extintor_lvl >= 3
                  can :read, Mangueira if user.controle_de_extintor_lvl >= 1
                  can :create, Mangueira if user.controle_de_extintor_lvl >= 2
                  can :update, Mangueira if user.controle_de_extintor_lvl >= 3
                  can :read, Hidrante if user.controle_de_extintor_lvl >= 1
                  can :create, Hidrante if user.controle_de_extintor_lvl >= 2
                  can :update, Hidrante if user.controle_de_extintor_lvl >= 3
                  can :read, Boia if user.controle_de_extintor_lvl >= 1
                  can :create, Boia if user.controle_de_extintor_lvl >= 2
                  can :update, Boia if user.controle_de_extintor_lvl >= 3
                  #fcontroles do sesmt

                  #inicio de filial
                  can :read, Filial if user.filial_lvl >= 1
                  can :create, Filial if user.filial_lvl >= 2
                  can :update, Filial if user.filial_lvl >= 3
                  #fim de filial
                  #inicio de mensagens
                  can :read, Mensagem if user.mensagem_lvl >= 1
                  can :create, Mensagem if user.mensagem_lvl >= 2
                  can :update, Mensagem if user.mensagem_lvl >= 3
                  #fim de mensagens
                  #inicio de navio
                  can :read, Navio if user.navio_lvl >= 1
                  can :create, Navio if user.navio_lvl >= 2
                  can :update, Navio if user.navio_lvl >= 3
                  #fim de navio
                  #inicio ordem de serviço
                  can :read, OrdemDeServico if user.ordem_de_servico_lvl >= 1
                  can :read, ActiveAdmin::Page, :name => "Pendente Departamento" if user.ordem_de_servico_lvl >= 1
                  can :read, ActiveAdmin::Page, :name => "Pendente Rebocador" if user.ordem_de_servico_lvl >= 1
                  can :read, ActiveAdmin::Page, :name => "Pendentes Manaus" if user.ordem_de_servico_lvl >= 1
                  can [:update, :create], OrdemDeServico if user.ordem_de_servico_lvl >= 2
                  can :destroy, OrdemDeServico if user.ordem_de_servico_lvl >= 3
                  #fim de ordem de serviço
                  #permissao de viagens
                  can :read, Viagem if user.viagem_lvl >= 1
                  can :create, Viagem if user.viagem_lvl >= 2
                  can :update, Viagem, :fim_viagem => nil if user.viagem_lvl >= 3
                  #fim de viagens

                  #fim de mensagens
         end

  end
end
