class AlbumsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
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

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      flash[:notice] = "Please Sign in to add a new item"
      redirect_to root_path
      # raise ActionController::RoutingError.new("Not Found")
    end
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:albums).permit(:title, :artist, :release_year,)
  end
end
