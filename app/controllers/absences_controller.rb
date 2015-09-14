class AbsencesController < ApplicationController
  before_action :set_absence, only: [:show, :update, :destroy]

  # GET /absences
  # GET /absences.json
  def index
    @absences = Absence.all

    render json: @absences
  end

  # GET /absences/1
  # GET /absences/1.json
  def show
    render json: @absence
  end

  # POST /absences
  # POST /absences.json
  def create
    @absence = Absence.new(absence_params)

    if @absence.save
      render json: @absence, status: :created, location: @absence
    else
      render json: @absence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /absences/1
  # PATCH/PUT /absences/1.json
  def update
    @absence = Absence.find(params[:id])

    if @absence.update(absence_params)
      head :no_content
    else
      render json: @absence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /absences/1
  # DELETE /absences/1.json
  def destroy
    @absence.destroy

    head :no_content
  end

  private

    def set_absence
      @absence = Absence.find(params[:id])
    end

    def absence_params
      params.require(:absence).permit(:reason, :date)
    end
end
