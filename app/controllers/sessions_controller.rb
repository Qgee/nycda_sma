class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    #find user by email address

    @user = User.find_by_email(params[:email])


    #if user exists and user is authenticated log them in

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Signed In"
      redirect_to students_path
    else
      flash[:alert] = ""
    end

    #if not, render :new view

  end

end
