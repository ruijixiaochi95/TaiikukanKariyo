class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  private
  # 体育館検索
  def search
    @search_word = params[:q][:name_or_address_cont] if params[:q]
    @q_gym = Gym.ransack(params[:q])
    @gyms = @q_gym.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_users_path
    elsif resource_or_scope.is_a?(GymManager)
      gym_manager_reservations_path
    else
      root_path
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :encrypted_password, :password_confirmation])
  end
end
