class AuthenticationController < ApplicationController
  def register_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "Successfully registered!"
      redirect_to new_user_path
    else
      render :register_user, status: :unprocessable_entity
    end
  end



  def register_dentist
    @dentist = Dentist.new
  end
  
  def create_dentist
    @dentist = Dentist.new(dentist_params)
    if @dentist.save
      session[:dentist_id] = @dentist.id
      flash[:notice] = "Successfully registered!"
      redirect_to login_path
    else
      render :register_dentist, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :middlename, :lastname, :birthdate, :phone_number, :age, :medicalhistory)
  end


  def dentist_params
    params.require(:dentist).permit(:firstname, :middlename, :lastname, :birthdate, :phone_number, :email, :username, :password, :password_confirmation)
  end

end