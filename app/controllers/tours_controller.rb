class ToursController < ApplicationController
  before_action :authenticate_user


  def index
    @tours = current_user.tours
    render template: "tours/index"
  end
  
  def show
    @tour = current_user.tours.find_by(
      id: params[:id],
    )


    if @tour
      render template: "tours/show"
    else
      render json: {message: "STOP, you suck"}
    end
  end


  def create
    @tour = Tour.new(
      user_id:current_user.id,
      name:params[:name]
    )
    
    if @tour.save
      render json: @tour
    else
      render json: { errors: @tour.errors.full_messages }, status: 422
    end
  end

  def update
    tour = Tour.find_by(id: params[:id])
    tour.name = params[:name] || tour.name
    if tour.save
      render json: tour
    else
      render json: { errors: tour.errors.full_messages }, status: :bad_request
    end
  end



  def destroy
    @tour_id = params[:id]
    @tour = Tour.find(@tour_id)

    @tour.destroy
    render json: {message: "This has been destroyed"}
  end  

end
