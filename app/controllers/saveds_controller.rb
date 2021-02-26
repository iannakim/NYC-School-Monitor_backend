class SavedsController < ApplicationController
  before_action :authorized, only: [:create]
  
  def index
    @saveds = Saved.all 
    render json: @saveds
  end

  def show
    @saved = Saved.find(params[:id])
    render json: @saved
  end

  # when a user saves a school, create a saved object attached to that user
  def create
    @saved = @user.saveds.create(saved_params)
    render json: @saved
  end


  def delete
    @saved = Saved.find(params[:id])
    @saved.destroy
    render json: Saved.all
  end



  private

  def saved_params
    params.permit(:school_id)
  end
end
