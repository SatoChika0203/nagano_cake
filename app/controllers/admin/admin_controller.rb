class Admin::AdminController < ApplicationController
  # before_action :authenticate_user!, except: [:top]
  
  def after_sign_in_path_for(resource)
    flash[:notice]="Signed in successfully."
    admin_items_path
  end
  
  def after_sign_out_path_for(resource)
    flash[:notice]="Signed out successfully."
    admin_root_path
  end
end
