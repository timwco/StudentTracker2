class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

    render json: @reports
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    render json: @report
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      head :no_content
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy

    head :no_content
  end

  private

    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params[:report]
    end
end
