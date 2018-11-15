class UsersController < ApplicationController
  def new 
    render :new 
  end 
  
  def create
    user = User.new(user_params)
    if user.save 
      login(user)
      # render json: user
      redirect_to cats_url 
    else 
      render json: user.errors.full_messages, status: 422
      # redirect_to new_user_url
    end 
  end 
  
  def show 
  end 
  
  private
  def user_params
    params.require(:user).permit(:user_name, :password)
    # :user argument in 'require' is fetched from the submitted new form?
  end 
  
end
