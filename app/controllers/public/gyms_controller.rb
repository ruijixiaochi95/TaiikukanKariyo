class Public::GymsController < ApplicationController
  # 体育館一覧
  def index
    @gyms = Gym.all
  end
  # 体育館一覧
  def show
    @gym = Gym.find(params[:id])
    @facilities = @gym.facilities
    @facility = Facility.find(params[:facility_id]) if params[:facility_id].present?
  
    respond_to do |format|
      format.html
      format.js
    end
  end 
end
