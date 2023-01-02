class BreweriesToursController < ApplicationController

  def index
    @brewery_tour = BreweryTour.all
    render json: @brewery_tour
  end
  
  def create
    @brewery_tour = BreweryTour.new(
      brewery_id:params[:brewery_id],
      tour_id:params[:tour_id]
    )
    
    if @brewery_tour.save
      render json: @brewery_tour
    else
      render json: { errors: @brewery_tour.errors.full_messages }, status: 422
    end
  end

  def show
    @brewery_tour = BreweryTour.find_by(id: params[:id])
    render json: @brewery_tour
  end





end
