class WufooController < ApplicationController

  require 'wuparty'

  ACCOUNT = ENV['WUFOO_ACCOUNT']
  API_KEY = ENV['WUFOO_TOKEN']

  def get_forms
    @wufoo = WuParty.new(ACCOUNT, API_KEY);
    @forms = @wufoo.forms
    render json: @forms
  end



end
