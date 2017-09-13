
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

  private
  def review_params
    params.require(:review).permit(:rating, :review, :album_id)
  end
end
