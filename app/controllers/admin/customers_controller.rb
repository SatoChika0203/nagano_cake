class Admin::CustomersController < ApplicationController
  def index
  end

  def show
    @customer=Customer.find(params[:id])
    
  end

  def edit
  end
  
  def update
  end
  
private

def customer_params
  params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :encrypted_password)
end

end
