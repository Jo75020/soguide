class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @guide = Guide.find(params[:guide_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @guide = Guide.find(params[:guide_id])
    @review.user = current_user
    @review.guide = Guide.find(params[:guide_id])
    @reviews.checked = "false"
    @review.save
    redirect_to guide_path(@guide)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
