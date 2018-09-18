class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_cred(
      params[:user][:username], 
      params[:user][:password]
    )
    if @user 
      login(user)
      redirect_to user_url(@user)
    else 
      flash.now[:errors] = ["Wrong credentials!"]
      render :new
    end 
  end

  def destroy
    logout
    render :new
  end
end
