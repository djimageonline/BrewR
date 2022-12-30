class BreweriesController < ApplicationController

  def index
    breweries = Brewery.all
    render json: breweries.as_json
  end

  def show
    brewery = Brewery.find_by(id: params[:id])
    render json: brewery.as_json
  end


end
