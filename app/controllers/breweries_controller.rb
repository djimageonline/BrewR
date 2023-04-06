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

    pp show[0]["id"]
    pp "whats wrong"

    index = 0
    brewery_names = []
    
    while index < show.length
      brewery_names << show[index]["name"]
      index += 1
    end


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
