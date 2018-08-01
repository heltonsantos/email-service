class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report.confirmation.subject
  #
  def confirmation
    @greeting = "Hi"

 		attachments['produtos-report-test.csv'] = File.read('db/produtos-report-test.csv')
    mail to: "helton.santos@skyhub.com.br", subject: "Confirmação de envio"
  end
end
