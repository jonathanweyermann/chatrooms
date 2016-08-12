class Operators::HelpchatsController < Operators::ApplicationController
  before_action :authenticate_operator!
  expose(:helpchats) { Helpchat.in_queue }
  expose(:helpchat)


  def close
    helpchat.completed!
    helpchat.save
    QueueJob.perform_later({customer_id: helpchat.customer_id , count: Helpchat.in_queue.count, helpchat_id: helpchat.id })
    redirect_to operators_helpchats_path
  end

  private

  def helpchat_params
    params.require(:helpchat).permit(:name, :customer_id)
  end
end
