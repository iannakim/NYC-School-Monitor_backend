class NeighborhoodsController < ApplicationController

  def index
    @neighborhoods = Neighborhood.all 
    render json: @neighborhoods 
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    render json: @neighborhood
  end

end
