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
    
    brewery = Brewery.find_by(
      name: params[:name]
    )
    
    if !brewery
      address = "#{params[:street]}, #{params[:city]}, #{params[:state]}, #{params[:zip]}"

      brewery = Brewery.new(
        name: params[:name],
        address: address,
        description: params[:url]
      )  
      brewery.save
    end

    pp brewery
  


    # @brewery_tour = BreweryTour.new(
    #   brewery_id:params[:brewery_id],
    #   tour_id:params[:tour_id]

    # )
    
    # if @brewery_tour.save
    #   render json: @brewery_tour
    # else
    #   render json: { errors: @brewery_tour.errors.full_messages }, status: 422
    # end
  end

  def show
    @brewery_tour = BreweryTour.find_by(id: params[:id])
    render json: @brewery_tour
  end





end
