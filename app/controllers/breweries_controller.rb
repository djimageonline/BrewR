class BreweriesController < ApplicationController

  def index
    # @brewery = Brewery.all
    # render json: @brewery.as_json
  
    #params
    pp params[:city]
    city = params["city"] || "orlando"
    state = params["state"]  || "fl"

    response = HTTP.get("http://beermapping.com/webservice/loccity/#{Rails.application.credentials.beer_api[:api_key]}/#{city},#{state}&s=json")

    show = response.parse(:json)

    index = 0
    brewery_names = []
    while index < show.length
      brewery_names << show[index]["name"]
      index += 1
    end

    render json:  show.as_json
  end


  def show
    @brewery = Brewery.find_by(id: params[:id])
    render json: @brewery.as_json
  end


end
