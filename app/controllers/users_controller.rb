class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def dashboard
    @user = Current.user
    @appointments = @user.appointments.upcoming 
  end

  def index 
    @user = Current.user
  end

  def show 
    
  end

  def new 
     @user = User.new
  end 

  def create 
    @user = Current.user.new(user_params)
    if @user.save 
      redirect_to users_path(@user)
    else 
      render :new
    end
  end 

  def edit 

  end 

  def update 
    if @user.update(user_params)
      redirect_to users_path(@user)
    else 
      render :edit
    end
  end 
  
  def destroy 
    @patient.destroy 
    redirect_to users_path
  end

  private 

  def set_user 
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:firstname)
  end
end
  