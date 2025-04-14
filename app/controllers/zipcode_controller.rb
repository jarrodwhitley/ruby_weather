class ZipcodeController < ApplicationController
  def search
    @zipcode = params[:zipcode]
    redirect_to home_zipcode_path(zipcode: @zipcode)
  end
end
