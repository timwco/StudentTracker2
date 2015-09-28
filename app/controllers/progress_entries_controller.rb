class ProgressEntriesController < ApplicationController
  before_action :set_progress_entry, only: [:show, :update, :destroy]

  # GET /progress_entries
  # GET /progress_entries.json
  def index
    @progress_entries = ProgressEntry.all

    render json: @progress_entries
  end

  # GET /progress_entries/1
  # GET /progress_entries/1.json
  def show
    render json: @progress_entry
  end

  # POST /progress_entries
  # POST /progress_entries.json
  def create
    @progress_entry = ProgressEntry.new(progress_entry_params)

    if @progress_entry.save
      render json: @progress_entry, status: :created, location: @progress_entry
    else
      render json: @progress_entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /progress_entries/1
  # PATCH/PUT /progress_entries/1.json
  def update
    @progress_entry = ProgressEntry.find(params[:id])

    if @progress_entry.update(progress_entry_params)
      head :no_content
    else
      render json: @progress_entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /progress_entries/1
  # DELETE /progress_entries/1.json
  def destroy
    @progress_entry.destroy

    head :no_content
  end

  private

    def set_progress_entry
      @progress_entry = ProgressEntry.find(params[:id])
    end

    def progress_entry_params
      params[:progress_entry]
    end
end
