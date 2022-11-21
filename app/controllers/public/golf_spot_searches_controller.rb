class Public::GolfSpotSearchesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @golf_spots = GolfSpot.looks(params[:search], params[:word])
  end
  
  def show
    @golf_spots = GolfSpot.looks(params[:search], params[:word])
  end
  
  def search
   @golf_spots = GolfSpot.looks(params[:search], params[:word])
  end
end
