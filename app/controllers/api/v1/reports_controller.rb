class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  protect_from_forgery with: :null_session


    def upload_report
    uploaded_io = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to emails_path 
  end



  # Default code

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
    render json: @reports
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    render json: @reports
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    if @report.save
      render json: @report, status: :created, location: api_v1_report_url(@report)
   else
      render json: @report.errors, status: :unprocessable_entit
    end
 
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update

    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end

  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:path_name)
    end
end
