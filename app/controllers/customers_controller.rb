class CustomersController < ApplicationController
  before_action :authenticate_customer!
  #before_action :set_helpchat
  expose(:customer) { current_customer }
  expose :helpchat
  expose(:queue_number) { Helpchat.in_queue.count }

  def create
    if customer.save
      redirect_to customer
    else
      render :new
    end
  end

  def destroy
    @customer = @helpchat.customers.where(user_id: current_user.id).destroy_all
    redirect_to helpchats_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :membership_number, :problem_description)
  end
end
