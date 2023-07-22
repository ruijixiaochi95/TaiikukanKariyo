class Public::FacilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gym_and_facility
  # 施設一覧
  def index
    @facilities = @gym.facilities
  end
  
  private

  def set_gym_and_facility
    @gym = Gym.find(params[:gym_id])
  end
end
