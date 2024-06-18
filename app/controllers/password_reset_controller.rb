class PasswordResetController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user.present?
			#Send Email
			PasswordMailer.with(user: @user).reset.deliver_now
		end
		redirect_to root_path, notice: "We have sent a link in your email to reset your password!"
	end

	def edit
		@user = User.find_signed!(params[:token], purpose: "password_reset")
		rescue ActiveSupport::MessageVerifier::InvalidSignature
		  redirect_to login_path, alert: "Your token has expired. Please try again"
		end


	def update
	  @user = User.find_signed!(params[:token], purpose: "password_reset")
	  if @user.update(password_params)
	    redirect_to login_path, notice: "Your password was reset successfully! Please Sign In."

	  else
	  	puts params.inspect
	    render :edit, status: :unprocessable_entity
	  end
	end

	private

	def password_params
  		params.require(:users).permit(:password, :password_confirmation)
	end

end
