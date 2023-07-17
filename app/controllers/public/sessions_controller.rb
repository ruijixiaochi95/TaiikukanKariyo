# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state,only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
  # 退会しているかの確認
  def user_state
    # 入力されたメールアドレスからアカウントを取得
    @user = User.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合、メソッドを終了
    return if !@user
    # 取得できた場合、パスワードを照合し退会済みであれば新規登録画面へ遷移
    if @user.valid_password?(params[:user][:password])
       if @user.is_active == true
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
          redirect_to new_user_registration_path
      # 有効であればメソッドを終了
       return elsif @user.is_active == false
       end
    end
  end
end
