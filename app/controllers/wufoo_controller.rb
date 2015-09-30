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
    # @entries = form.entries(filters: [['Field1', 'Contains', params[:user]]])
    @entries = form.entries(filters: [['Field1', 'Contains', 'demostudent']], system: true)
    # @fields = form.fields
    render json: @entries
  end


end
