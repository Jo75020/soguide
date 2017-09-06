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
    if @review.save
      flash[:notice] = "Votre avis à bien été pris en compte il sera disponible dans quelques instants"
    else
      flash[:alert] = "Votre avis n'a pas été pris en compte car vous n'avez pas rempli de content"
    end
    redirect_to guide_path(@guide)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
