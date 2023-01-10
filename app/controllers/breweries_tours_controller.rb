class BreweriesToursController < ApplicationController

  def index
    @brewery_tour = BreweryTour.all
    render json: @brewery_tour

  end
  
  def create

    #Step1: locate brewery in database
    #Step2: if you dont find brewery , create that brewery in db
    #Step3: use brewery id (wether you found it or created it)  ----- These are done
    #Step4: get tours that belong to current user :name
    #Step5: create the brewery tour entry: 

    breweryId = params[:brewery]
    name = params[:name]
    street = params[:street]
    city = params[:city]
    state = params[:state]
    zip = params[:zip]
    url = params[:url]

    brewery = Brewery.find_by(
      name: params[:name]
    )
    
    if !brewery
      # address = "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zip]}"

      address = "#{street}, #{city}, #{state}, #{zip}"

      brewery = Brewery.new(
        name: name,
        address: address,
        description: url
      )  
      brewery.save
    end

    
    brewery_tour = BreweryTour.new(
      user_id: current_user.id,
      brewery_id: brewery.id,
      tour_id: params[:tour]
    )
    
    if brewery_tour.save
      render json: brewery_tour.as_json
    else
      render json: { errors: brewery_tour.errors.full_messages }, status: 422
    end
  end


  def show
    @brewery_tour = BreweryTour.find_by(id: params[:id])
    render json: @brewery_tour
  end

  def destroy
    pp params
    @brewery_tour = BreweryTour.where(brewery_id: params[:brew_id], tour_id: params[:tour_id])
  
    @brewery_tour[0].destroy
    render json: {message: "This has been destroyed"}
  end  


end
