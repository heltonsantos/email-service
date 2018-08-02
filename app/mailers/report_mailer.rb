class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report.confirmation.subject
  #
  def confirmation
    @greeting = "Hi"

 		attachments['produtos-report-test.csv'] = File.read('db/produtos-report-test.csv')
    mail to: "helton.santos@skyhub.com.br", subject: "Confirmation"
  end

  def send_report(file_name)
  	@greeting = "Hi Seller"

 		attachments[file_name] = File.read("public/uploads/#{file_name}")
    mail to: "helton.santos@skyhub.com.br", subject: "Report is ready"

  end	
end
