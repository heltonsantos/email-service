require "rails_helper"

RSpec.describe ReportMailer, type: :mailer do
  describe "confirmation" do
    let(:mail) { ReportMailer.confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmação de envio")
      expect(mail.to).to eq(["helton.santos@skyhub.com.br"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end