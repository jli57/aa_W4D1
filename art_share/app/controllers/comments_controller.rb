class CommentsController < ApplicationController

  def index
    user_id = comments_params[:user_id]
    artwork_id = comments_params[:artwork_id]

    if user_id.nil? && artwork_id.nil?
      comments = Comment.all
    elsif !user_id.nil?
      comments = Comment.where('user_id = ?', user_id)
    elsif !artwork_id.nil?
      comments = Comment.where('artwork_id = ?', artwork_id)
    end

    render json: comments
  end


  def create
    @comment = Comment.new(comments_params)

    if @comment.save
      render json: @comment
    else
      unprocessable_entity
    end

  end

  def destroy
    @comment = Comment.find_by(id: id)

    if @comment.nil?
      not_found
    elsif @comment.destroy
      redirect_to comments_url
    else
      unprocessable_entity
    end
  end

  private
  def comments_params
    params.permit(:user_id, :artwork_id, :body)
  end

  def id
    params[:id]
  end

  def not_found
    render "Comment not found", status: 404
  end

  def unprocessable_entity
    render json: @comment.errors.full_messages, status: 422
  end

end
