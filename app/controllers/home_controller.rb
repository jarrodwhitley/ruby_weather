class HomeController < ApplicationController
  def index
    require "net/http"
    require "json"

    @url = "https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=75067&distance=25&API_KEY=17327A63-EDE4-40C1-981F-B9C56BE8C55B"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    @aqi_color = nil
    @aqi_description = nil

    def setAqiColor(num)
      if num <= 50
        return "green"
      end

      if num > 50 && num <= 100
        return "yellow"
      end

      if num > 100 && num <= 150
        return "orange"
      end

      if num > 150 && num <= 200
        return "red"
      end

      if num > 200 && num <= 300
        return "purple"
      end

      if num > 300
        "maroon"
      end
    end

    if @output.empty? ||!@output
      @final_output = "Error"
    else
      @final_output = @output[0]["AQI"]
      @aqi_color = setAqiColor(@final_output)
      @aqi_description = @output[0]["Category"]["Name"]
    end
  end

  def zipCode
    @zipcode = params[:zipcode]
    render :zipcode
  end
end
