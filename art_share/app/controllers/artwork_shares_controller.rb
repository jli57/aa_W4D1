class ArtworkSharesController < ApplicationController

  def create
    @artwork_share = ArtworkShare.new(artwork_shares_params)

    if @artwork_share.save
      render json: @artwork_share
    else
      unprocessable_entity
    end

  end

  def update
    @artwork_share = ArtworkShare.find_by(id: id)

    if @artwork_share.nil?
      not_found
    elsif @artwork_share.update(artwork_shares_params)
      render json: @artwork_share
    else
      unprocessable_entity
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find_by(id: id)

    if @artwork_share.nil?
      not_found
    elsif @artwork_share.destroy
      redirect_to artworks_url
    else
      unprocessable_entity
    end
  end

  private
  def artwork_shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

  def id
    params[:id]
  end

  def not_found
    render "ArtworkShare not found", status: 404
  end

  def unprocessable_entity
    render json: @artwork_share.errors.full_messages, status: 422
  end

end
