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
    user = User.find_by(id: id)
    
    if user
      render json: user 
    else  
      render json: 'User Not Found', status: 404 
    end 
  end 
  
  def update
    user = User.find_by(id: id)
    
    if user.nil?
      render plain: 'User Not Found', status: 404 
    elsif user.update(strong_params)
      render json: user
    else 
      render json: user.errors.full_messages, status: 422
    end 
  end 
  
  def destroy 
    user = User.find_by(id: id)
    
    if user.nil?
      render plain: 'User Not Found', status: 404 
    elsif user.destroy
      redirect_to users_url
    else 
      render json: user.errors.full_messages, status: 422
    end 
      
  end 
  
  def strong_params 
    params.require(:user).permit(:name, :email)
  end 
  
  def id 
    params[:id]
  end 
  
end 