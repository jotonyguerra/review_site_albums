class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  #   if !params[:album_title].empty?
  #    @albums = RSpotify::Album.search(params[:album_title])
  #  else
  #    redirect_to root_path
  #  end
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  def show
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end
  #testing things out
  # ActionController::Parameters.permit_all_parameters = true
  def album_params
    params.require(:album).
        permit(
          :title,
          :artist,
          :release_year,
          :name
        )
  end
end
