class HelpchatsController < ApplicationController
  expose(:helpchat) { current_customer.helpchats.last || Helpchat.new(helpchat_params) }

  def create
    if helpchat.save
      ChatRequestJob.perform_later(helpchat)
      redirect_to customer_helpchat_path(helpchat.customer_id, helpchat.id)
    else
    end
  end

  def update
    if helpchat.in_queue?
      redirect_to customer_helpchat_path(helpchat.customer_id, helpchat.id), alert: "You are already in queue to speak with an agent"
    else
      h = Helpchat.new(helpchat_params)
      h.in_queue!
      h.save
      ChatRequestJob.perform_later(h)
      redirect_to customer_helpchat_path(helpchat.customer_id, helpchat.id)
    end
  end

  def close
    helpchat.completed!
    helpchat.save
    ChatRequestJob.perform_later(helpchat)
    QueueJob.perform_later({customer_id: helpchat.customer_id , count: Helpchat.in_queue.count, helpchat_id: helpchat.id })
    redirect_to current_customer
  end


  private

  def helpchat_params
    params.require(:helpchat).permit(:name, :customer_id)
  end
end
