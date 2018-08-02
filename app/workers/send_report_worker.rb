class SendReportWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
 	sidekiq_options retry: false

  def perform(file_name)
  	ReportMailer.send_report(file_name).deliver_now!
    # Do something
  end
end
