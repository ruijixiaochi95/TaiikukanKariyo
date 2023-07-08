class GymManager::GymsController < ApplicationController
  def new
    @gym = Gym.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @gym = Gym.new(gym_params)
    @gym.save
    redirect_to gym_manager_gyms_path
  end

  private
  def gym_params
    params.require(:gym).permit(:name, :postal_code, :address, :phone_number, :caption, :is_open, :image)
  end
end
