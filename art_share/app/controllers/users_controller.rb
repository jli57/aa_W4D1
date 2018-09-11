class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end

  def show
    @user = User.find_by(id: id)

    if @user.nil?
      not_found
    else
      render json: @user
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      unprocessable_entity
    end

  end

  def update
    @user = User.find_by(id: id)

    if @user.nil?
      not_found
    elsif @user.update(user_params)
      render json: @user
    else
      unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: id)

    if @user.nil?
      not_found
    elsif @user.destroy
      redirect_to users_url
    else
      unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end

  def id
    params[:id]
  end

  def not_found
    render "User not found", status: 404
  end

  def unprocessable_entity
    render json: @user.errors.full_messages, status: 422
  end

end
