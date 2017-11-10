class MessageDecorator < Draper::Decorator
  delegate_all

  def name
    if owner==0 || owner==false
      Customer.find(customer_id).username
    else
      Operator.find(operator_id).username
    end
  end
end
