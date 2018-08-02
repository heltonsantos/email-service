require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "POST /upload_report" do
    it "works! (now write some real specs)" do
    	csv = File.read('db/produtos-report-test.csv')
    	params = {:file => csv}
    	headers = { "CONTENT_TYPE" => "multipart/form-data" }
      post upload_report_api_v1_reports_path, params, headers
      expect(response).to have_http_status(200)
    end
  end
end
