class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!
 
    def show
     @customer=Customer.find(current_customer.id)
        
    end
    
    def edit
     @customer=Customer.find(current_customer.id)
    end
    
    def update
     @customer=Customer.find(current_customer.id)
     if @customer.update(customer_params)
        redirect_to customers_path
     else
        render :edit
     end
    end
    
    def confirm
    end
    
    def withdraw
     current_customer.update(is_deleted: true)
     # is_deletedカラムをtrueにupdateする事により、退会状態を作り出す
     reset_session
     redirect_to root_path
    end
 
 private

 def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
 end
end
