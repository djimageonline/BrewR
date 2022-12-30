class BreweriesToursController < ApplicationController

  def index
    breweries_tours = Brewery.all
    render json: breweries_tours
  end
  
  def create
    brewery_tour = BreweryTour.new(
      breweries_id:params[:breweries_id],
      tours_id:params[:tours_id]
    )
    
    if brewery_tour.save
      render json: brewery_tour
    else
      render json: { errors: brewery_tour.errors.full_messages }, status: 422
    end

  end
end
