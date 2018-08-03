require "rails_helper"

RSpec.describe ReportMailer, type: :mailer do
  describe "confirmation" do
    let(:mail) { ReportMailer.confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmation")
      expect(mail.to).to eq(["helton.santos@skyhub.com.br"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "send_report" do
    file_name = "produtos-report-test.csv"

    FileUtils.cp("spec/fixtures/#{file_name}", "public/uploads/#{Rails.env}/#{file_name}")

    let(:mail) { ReportMailer.send_report(file_name) }

    it "renders the headers" do
      expect(mail.subject).to eq("Report is ready")
      expect(mail.to).to eq(["helton.santos@skyhub.com.br"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi Seller")
    end

    it "renders the attachments" do 
      expect(mail.attachments).not_to be_nil
    end
  end

end
