class GymManager::FacilitiesController < ApplicationController

  def create
    @gym = Gym.find(params[:gym_id])
    @facility = Facility.new(facility_params)
    @facility.gym_id = @gym.id
    @facility.save
    redirect_to gym_manager_gym_path(@gym.id)
  end

  def destroy
    Facility.find(params[:id]).destroy
    @gym = Gym.find(params[:gym_id])
    redirect_to gym_manager_gym_path(@gym.id)
  end

  private

  def facility_params
    params.require(:facility).permit(:name, :gym_id)
  end
end
