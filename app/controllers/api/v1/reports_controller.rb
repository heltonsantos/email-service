class Api::V1::ReportsController < ApplicationController

  protect_from_forgery with: :null_session

  def upload_report
    uploaded_io = params[:file]
    file_name = "report-#{Time.now.to_i}-#{generate_token}.csv"
    
    File.open(Rails.root.join("public", "uploads/#{Rails.env}", file_name), 'wb') do |file|
      file.write(uploaded_io)
    end
    SendReportWorker.perform_async(file_name)
    head :ok 
  end

  protected

    def generate_token
      token = SecureRandom.urlsafe_base64
    end 

end
