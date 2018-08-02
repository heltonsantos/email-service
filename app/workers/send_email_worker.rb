class SendEmailWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
 	sidekiq_options retry: false

  def perform()
    ReportMailer.confirmation.deliver_now!
  end
end
