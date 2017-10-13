class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to product_path(@review.product_id)
      end
    end

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  private
    def logged_in?
      if(current_user)
        true
      else
        false
      end
    end

    def require_login

      unless logged_in?
        flash[:error] = "You must be logged in to access this section."
        redirect_to '/login'
      end
    end
end