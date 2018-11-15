class SessionsController < ApplicationController

  def new 
    render :new 
  end 
  
  def create
    # verify username & password
    
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      login(@user)
      redirect_to cats_url
    else
      render json: ["invalid credentials"], status: 401
    end
  end 
  
  def destroy
    self.current_user.reset_session_token!
    session[:session_token] = nil
  end 


end
