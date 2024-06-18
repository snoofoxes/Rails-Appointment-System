class SessionsController < ApplicationController
	def new_user
	end

	def create_user
		user = User.find_by(email: params[:email])
		if user.present? && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to users_dashboard_path notice: "Logged In Succesfully"
		else
			flash[:alert] = "Invalid Email or Password"
			render :new_user, status: :unprocessable_entity
		end
	end

	def destroy_user
		session[:user_id] = nil
		redirect_to root_path, notice: "Logged Out"
	end

	def new_dentist
	end

	def create_dentist
		dentist = Dentist.find_by(email: params[:email])
		if dentist.present? && dentist.authenticate(params[:password])
			session[:dentist_id] = dentist.id
			redirect_to dentists_dashboard_path, notice: "Logged In Succesfully"
		else
			flash[:alert] = "Invalid Email or Password"
			render :new_dentist, status: :unprocessable_entity
		end
	end

	def destroy_dentist
		session[:dentist_id] = nil
		redirect_to root_path, notice: "Logged Out"
	end

end
