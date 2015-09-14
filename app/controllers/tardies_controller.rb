class TardiesController < ApplicationController
  before_action :set_tardy, only: [:show, :update, :destroy]

  # GET /tardies
  # GET /tardies.json
  def index
    @tardies = Tardy.all

    render json: @tardies
  end

  # GET /tardies/1
  # GET /tardies/1.json
  def show
    render json: @tardy
  end

  # POST /tardies
  # POST /tardies.json
  def create
    @tardy = Tardy.new(tardy_params)

    if @tardy.save
      render json: @tardy, status: :created, location: @tardy
    else
      render json: @tardy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tardies/1
  # PATCH/PUT /tardies/1.json
  def update
    @tardy = Tardy.find(params[:id])

    if @tardy.update(tardy_params)
      head :no_content
    else
      render json: @tardy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tardies/1
  # DELETE /tardies/1.json
  def destroy
    @tardy.destroy

    head :no_content
  end

  private

    def set_tardy
      @tardy = Tardy.find(params[:id])
    end

    def tardy_params
      params.require(:tardy).permit(:less_than_15, :reason, :date)
    end
end
