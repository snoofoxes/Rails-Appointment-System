class ApplicationController < ActionController::Base
	before_action :set_current_user
    before_action :set_current_dentist

	def set_current_user
        if session[:user_id]
         Current.user = User.find_by(id: session[:user_id])
        end
    end


    def require_user_logged_in!
    	redirect_to login_path, alert: "You must be signed in to do that." if Current.user.nil?
    end

    def set_current_dentist
        if session[:dentist_id]
            Current.dentist = Dentist.find_by(id: session[:dentist_id])
        end
    end

    def require_dentist_logged_in!
        redirect_to login_path, alert: "You must be signed in to do that." if Current.dentist.nil?
    end
end
