class AlbumsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @review = @album.reviews.build
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    if @album.save
      flash[:notice] = 'Successfully added album'
      redirect_to albums_path
    else
      flash[:notice] = 'Title and Artist must be filled'
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      flash[:notice] = "Album updated"
    else
      render 'edit'
    end
  end

  def destroy
    Album.find(params[:id]).destroy
    flash[:success] = "Album Deleted"
    redirect_to root_path
  end

  protected

  def authorize_user
    if !user_signed_in?
      flash[:notice] = "Please Sign in to add a new item"
      redirect_to root_path
    end
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artist, :release_year)
  end
end
