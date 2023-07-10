class GymManager::FacilitiesController < ApplicationController
  def index
  end

  def edit
  end
  
  def update
  end 
  
  def create
    @gym = Gym.find(params[:id])
    @facility = Facility.new(facility_params)
    @facility.gym_id = @gym.id
    @facility.save
  end 
  
  private
  
  def facility_params
    params.require(:facility).permit(:name)
  end
end
