class EmailsController < ApplicationController

	def index
	end	

	def send_confirmation
		SendEmailWorker.perform_async
		redirect_to emails_path
	end	

end
