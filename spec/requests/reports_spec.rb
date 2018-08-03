require 'rails_helper'

require 'sidekiq/testing'
Sidekiq::Testing.fake!
RSpec.describe "Reports", type: :request do
  describe "POST /upload_report" do
    it "sends a request to the controller and check if the SendReportWorker is work" do
      expect {
			  csv = File.read('spec/fixtures//produtos-report-test.csv')
			    	params = {:file => csv}
			    	headers = { "CONTENT_TYPE" => "multipart/form-data" }
			      post upload_report_api_v1_reports_path, params, headers
			      expect(response).to have_http_status(200)
			}.to change(SendReportWorker.jobs, :size).by(1)
    end
  end
end
