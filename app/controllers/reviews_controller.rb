class ReviewsController < ApplicationController
  before_action :authorized, only: [:create]
  
  def index
    @reviews = Review.all 
    render json: @reviews
  end

  def show
    @review = Review.find(params[:id])
    render json: @review
  end


  def create
    @review = @user.reviews.create(review_params)
    render json: @review
  end


  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    render json: @review
  end


  def delete
    @review = Review.find(params[:id])
    @review.destroy
    render json: Review.all
  end



  private

  def review_params
    params.permit(:content, :school_id)
  end

end
