class AuthController < ApplicationController

  def github
    render json: { name: 'Tim' }
  end


end
