class ApplicationController < ActionController::Base
	include CanCan::ControllerAdditions
	# has_mobile_fu
	
	
	
	protect_from_forgery
		before_action :authenticate_user!
		#before_action :set_paper_trail_whodunnit
	
	
	
		def access_denied(exception)
			#flash[:error] = "Acesso nao autorizado!"
			redirect_to admin_root_path, :notice => "Acesso nao autorizado!"
		end
	
		  def current_ability
			@current_ability ||= Ability.new(current_user)
		  end
	
		def user_for_paper_trail
			  current_user
		end
	
	
	end
	