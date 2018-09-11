class ArtworksController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    artworks = Artwork
      .joins(:shared_viewers)
      .where("artist_id = ? OR viewer_id = ?", user.id, user.id)
    render json: artworks
  end

  def show
    @artwork = Artwork.find_by(id: id)

    if @artwork.nil?
      not_found
    else
      render json: @artwork
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork
    else
      unprocessable_entity
    end

  end

  def update
    @artwork = Artwork.find_by(id: id)

    if @artwork.nil?
      not_found
    elsif @artwork.update(artwork_params)
      render json: @artwork
    else
      unprocessable_entity
    end
  end

  def destroy
    @artwork = Artwork.find_by(id: id)

    if @artwork.nil?
      not_found
    elsif @artwork.destroy
      redirect_to artworks_url
    else
      unprocessable_entity
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end

  def id
    params[:id]
  end

  def not_found
    render "Artwork not found", status: 404
  end

  def unprocessable_entity
    render json: @artwork.errors.full_messages, status: 422
  end

end
