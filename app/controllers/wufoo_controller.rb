class WufooController < ApplicationController

  # Set Up Connection
  before_filter :wufoo_connect
  def wufoo_connect
    require 'wuparty'
    @wufoo = WuParty.new(ENV['WUFOO_ACCOUNT'], ENV['WUFOO_TOKEN']);
  end

  # Get All Forms
  def get_forms
    @forms = @wufoo.forms
    render json: @forms
  end

  # Get Single Form Entries (by name)
  def get_entries_by_name  
    form = @wufoo.form(params[:formId])

    begin
      @entries = form.entries(filters: [['Field1', 'Contains', params[:user]]])
      # @entries = form.entries(filters: [['Field1', 'Contains', 'demostudent']], system: true)
    rescue WuParty::HTTPError => e
      @error = e
    end

    # @fields = form.fields
    if @entries 
      render json: @entries
    elsif 
      render :json => { :error => 'Sorry, there is no report here yet.' }, :status => 200
    end
      
  end


end
