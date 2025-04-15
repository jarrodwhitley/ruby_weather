class ZipcodeController < ApplicationController
  def index
    @zip_query = params[:zipcode]
    if @zip_query.blank?
      flash[:alert] = "You must enter a zipcode"
      redirect_to root_path
    else
      require "net/http"
      require "json"

      @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{@zip_query}&distance=50&API_KEY=17327A63-EDE4-40C1-981F-B9C56BE8C55B"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)

      @output = JSON.parse(@response)

      if @output.empty? || !@output
        flash[:alert] = "Error fetching data for the provided zipcode."
        redirect_to root_path
      else
        @final_output = @output[0]
        @aqi_value = @final_output["AQI"]
        @aqi_color = setAqiColor(@aqi_value)
        @aqi_description = @final_output["Category"]["Name"]
        @city = @final_output["ReportingArea"]
        @state = @final_output["StateCode"]
      end
    end
  end

  private

  def setAqiColor(num)
    case num
    when 0..50 then "green"
    when 51..100 then "yellow"
    when 101..150 then "orange"
    when 151..200 then "red"
    when 201..300 then "purple"
    else "maroon"
    end
  end
end
