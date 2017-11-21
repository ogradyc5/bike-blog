class UsersController < ApplicationController
  
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the CycleHub Club #{@user.username}"
      redirect_to bicycles_path
    else
      render 'new'
    end 
  end

  private 
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
