require 'rails_helper'
RSpec.describe SendReportWorker, type: :worker do

	context 'when the worker is created' do
    it "creates the worker" do
      
      file_name = "produtos-report-test.csv"
    	FileUtils.cp("spec/fixtures/#{file_name}", "public/uploads/#{Rails.env}/#{file_name}")

      SendReportWorker.perform_async(file_name)
      expect(SendReportWorker.jobs.size).to eq(1)

      SendReportWorker.drain
      expect(SendReportWorker.jobs.size).to eq(0)    
    end
    
  end  

end
