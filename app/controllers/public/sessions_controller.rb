# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  before_action :authenticate_customer!, except: [:top, :about]
  
  def after_sign_in_path_for(resource)
    flash[:notice]="Signed in successfully."
    root_path
  end
  
  def after_sign_out_path_for(resource)
    flash[:notice]="Signed out successfully."
    root_path
  end
  
protected

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    # 入力されたemailからアカウントを1件取得
    return if !@customer
    # アカウントを取得できなかった場合、このメソッドを終了する
    if @customer.valid_password?(params[:customer][:password])
     # 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
     if @customer.is_deleted == true
       redirect_to new_customer_session_path
     end
    end
  end
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
end
