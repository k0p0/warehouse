class ReviewsController < ApplicationController

  def create
    @storehouse = Storehouse.find(params[:storehouse_id])
    @review = Review.new(review_params)
    @review.storehouse = @storehouse
    if @review.save
      redirect_to storehouse_path(@storehouse)
    else
      render 'storehouses/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
