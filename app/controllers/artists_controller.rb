class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.delete
    redirect_to artists_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update_attributes(artist_params)
    redirect_to artist_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end
end
