class Public::GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
    @facilities = @gym.facilities
    @facility = Facility.find(params[:facility_id]) if params[:facility_id].present?
  end
end
