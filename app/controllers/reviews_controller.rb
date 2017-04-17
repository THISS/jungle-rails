class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    # find the product
    @product = Product.find params[:product_id]
    # Use the product to create a new review
    rev = params[:review]
    @review = @product.reviews.new(
      user: current_user,
      description: rev[:description],
      rating: rev[:rating]
    )
    # attempt to save while including the @review.user = current_user
    if @review.save
    # redirect to the product show page
      redirect_to product_path @product
    # render the show page with the errors
  else
      # TODO: make sure you can render this...
      render product_path 
    end
  end

  def destroy
    @reviewed = Review.find params[:id]
    @product = @reviewed.product
    @reviewed.destroy
    redirect_to product_path @product
  end
end
