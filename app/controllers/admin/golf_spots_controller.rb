class Admin::GolfSpotsController < ApplicationController
  def index
    @golf_spot = GolfSpot.new
    @golf_spots = GolfSpot.all
  end
  
  def create
    @golf_spot = GolfSpot.new(golf_spot_params)
    @golf_spot.save
    redirect_to admin_golf_spots_path
  end

  def edit
    @golf_spot = GolfSpot.find(params[:id])
  end
  
  def update
    @golf_spot = GolfSpot.find(params[:id])
    @golf_spot.update(golf_spot_params)
    redirect_to admin_golf_spots_path
  end
  
  private
  def golf_spot_params
    params.require(:golf_spot).permit(:name)
  end
end
