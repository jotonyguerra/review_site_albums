class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:notice] = 'Successfully added album'
      redirect_to albums_path
    else
      flash[:notice] = 'Title and Artist must be filled'
      render :new
    end
  end

  def show
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

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
