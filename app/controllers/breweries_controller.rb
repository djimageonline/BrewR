class BreweriesController < ApplicationController

  def index
    city = params["city"] || "orlando"
    state = params["state"]  || "fl"
    
    response = HTTP.get("http://beermapping.com/webservice/loccity/#{Rails.application.credentials.beer_api[:api_key]}/#{city},#{state}&s=json")
    show = response.parse(:json)

    if !show[0]["id"]
      render json: [].as_json
    else
      render json:  show.as_json
    end
  end

  def show
    @brewery = Brewery.find_by(id: params[:id])
    render json: @brewery.as_json
  end
end
