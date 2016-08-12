module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_customer

    def connect
      self.current_customer = find_verified_user
      logger.add_tags "ActionCable", "User #{current_customer.id}"
    end

    protected

    def find_verified_user
      if current_customer = cookies[:current_customer]
        Customer.find(current_customer)
      elsif
        current_operator = cookies[:current_operator]
        Operator.find(current_operator)
      else
        reject_unauthorized_connection
      end
    end
  end
end
