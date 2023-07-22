class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search
  
  def search
    @q = Gym.ransack(params[:q])
    @item = @q.result(destinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end 

  private

    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_users_path
      elsif resource_or_scope.is_a?(GymManager)
        gym_manager_reservations_path
      else
        root_path
      end 
    end
    
    # def after_sign_out_path_for(resource_or_scope)
    #   if resource_or_scope == :admin
    #     new_admin_session_path
    #   elsif resource_or_scope == :customer
    #     root_path
    #   else 
    #     root_path
    #   end 
    # end 
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :encrypted_password, :password_confirmation])
    end
end
