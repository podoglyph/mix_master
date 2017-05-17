class ArtistsController < ApplicationController
before_action :set_artist, only: [:show]
  def index
    @artists = Artist.all
  end

  def show
    @artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end


end
