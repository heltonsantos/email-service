class EmailsController < ApplicationController

	def index
	end	

	def send_email
		redirect_to emails_path
	end	

end
