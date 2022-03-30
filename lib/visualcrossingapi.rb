require 'httparty'
require 'dotenv'
Dotenv.load

class VisualCrossingApi
  API_KEY = ENV["VISUAL_CROSSING_API_KEY"]
  def initialize(city)
    @city = city
  end

  def forecast
    response = HTTParty.get("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations=#{@city}&aggregateHours=24&unitGroup=uk&contentType=json&key=#{API_KEY}").parsed_response
    temperatures = {
      :today => response['locations']["#{@city}"]["values"][0]["temp"],
      :tomorrow => response['locations']["#{@city}"]["values"][1]["temp"],
      :third_day => response['locations']["#{@city}"]["values"][2]["temp"]
    }
  end
end
