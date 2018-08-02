class EmailsController < ApplicationController

	def index
	end	

	def send_confirmation
		SendEmailWorker.perform_async
		redirect_to emails_path
	end

  def send_report
  	uploaded_io = params[:file][:content]
  	file_name = "report-#{Time.now.to_i}-#{generate_token}.csv"
  	
    File.open(Rails.root.join('public', 'uploads', file_name), 'wb') do |file|
   	  	file.write(uploaded_io.read)
   	end

   	SendReportWorker.perform_async(file_name)
    redirect_to emails_path	
  end

  protected

    def generate_token
      token = SecureRandom.urlsafe_base64
    end  

end
