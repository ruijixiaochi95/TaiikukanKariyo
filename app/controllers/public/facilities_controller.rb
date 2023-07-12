class Public::FacilitiesController < ApplicationController
  before_action :set_gym_and_facility
  
  def index
    @facilities = @gym.facilities
  end
  
  def show 
    @facility = Facility.find(params[:id])
  end
  
  private

  def set_gym_and_facility
    @gym = Gym.find(params[:gym_id])
  end
end
