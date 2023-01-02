class ToursController < ApplicationController
  before_action :authenticate_user


  def show
    tour = Tour.find_by(
      id: params[:id],
      brewery_id: params[:brewery_id]
    )
    render json: tour
  end


  def create
    tour = Tour.new(
      user_id:current_user.id,
      brewery_id: params[:brewery_id]
    )
    
    if tour.save
      render json: tour
    else
      render json: { errors: tour.errors.full_messages }, status: 422
    end
  end

  def destroy
    tour_id = params[:id]
    tour = Tour.find(tour_id)

    tour.destroy
    render json: {message: "This has been destroyed"}
  end  

end
