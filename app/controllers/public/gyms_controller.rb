class Public::GymsController < ApplicationController
  # 体育館一覧
  def index
    @gyms = Gym.page(params[:page]).per(5) 
  end
  # 体育館一覧
  def show
    @gym = Gym.find(params[:id])
    @facilities = @gym.facilities
    @facility = Facility.find(params[:facility_id]) if params[:facility_id].present?
    @gym_comment = GymComment.new
  
    respond_to do |format|
      format.html
      format.js
    end
  end
end
