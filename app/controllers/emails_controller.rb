class EmailsController < ApplicationController

	def index
	end	

	def send_confirmation
		SendEmailWorker.perform_async
		redirect_to emails_path
	end


	def upload_file
  	uploaded_io = params[:file][:content]
  	File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    	file.write(uploaded_io.read)
    end
    redirect_to emails_path	
  end

end
