class SessionsController < ApplicationController

  before_action :authenticate, only: [:destroy]

  def new
  end

  def create

    #find user by email address

    @user = User.find_by_email(params[:email])


    #if user exists and user is authenticated log them in

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Signed In"
      redirect_to students_path
    else
      render :new
      flash.now[:alert] = "Invalid email or password"
    end

    #if not, render :new view
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end

end
