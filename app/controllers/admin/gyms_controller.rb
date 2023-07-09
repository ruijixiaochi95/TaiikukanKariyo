class Admin::GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def edit
  end
end
