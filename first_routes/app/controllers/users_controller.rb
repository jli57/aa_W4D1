class UsersController < ApplicationController 
  
  def index
    render plain: "I'm in the index action!" 
  end 
  
  def create 
    user = User.new(strong_params)
    
    if user.save
      render json: user 
    else 
      render json: user.errors.full_messages, status: 422 
    end 
  end 
  
  def show 
    user = User.find(params[:id])
    
    if user
      render json: user 
    else  
      render json: user.errors.full_messages, status: 404 
    end 
  end 
  
  def strong_params 
    params.require(:user).permit(:name, :email)
  end 
  
end 