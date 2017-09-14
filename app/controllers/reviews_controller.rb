
class ReviewsController < ApplicationController

  def create
    @album = Album.find(review_params[:album_id])
    @review = @album.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "Thanks for your input!"
    else
      flash[:error] = "Something is wrong with your review."
    end
    redirect_to @album
  end

  def edit
    @review = Review.find(params[:id])
    @album = Album.find(params[:album_id])
    render 'albums/reviews/edit'
  end

  def update
    @review = Review.find(params[:id])
    @album = Album.find(params[:album_id])
    @review.review = params[:review][:review]
    @review.rating = params[:review][:rating]
    if @review.review.nil? || @review.rating.nil?
      flash[:errors] = "review and/or rating cannot be empty "
      render 'edit'
    else
      @review.save
      flash[:success] = "review updated"
      redirect_to album_path(@album)
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review Deleted"
    redirect_to root_path
  end

  private
  def set_album
    @album = Album.find(review_params[:album_id])
  end

  def review_params
    params.require(:review).permit(:rating, :review, :album_id)
  end
end
