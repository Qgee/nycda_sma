class UsersController < ApplicationController

  before_action :authenticate

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      #add flash message and redirect to students index page
      flash[:notice] = "New user successfully created"
      redirect_to students_path
    else
      #render the new view
      flash[:alert] = "Problem creating new user... Please try agin."
      render :new
    end

  end


private

  def user_params
    params.require(:user).permit(:full_name,:email,:password,:password_confirmation)
  end 



end