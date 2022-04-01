require 'httparty'
require 'dotenv'
Dotenv.load

class WeatherApi
  API_KEY_VISUAL_CROSSING = ENV["VISUAL_CROSSING_API_KEY"]
  API_KEY_OPEN_WEATHER = ENV["OPEN_WEATHER_API_KEY"]
end

class VisualCrossingApi < WeatherApi
  
  def forecast(city)
    response = HTTParty.get("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations=#{city}&aggregateHours=24&unitGroup=uk&contentType=json&key=#{API_KEY_VISUAL_CROSSING}").parsed_response
    temperatures = {
      :today => response['locations']["#{city}"]["values"][0]["temp"],
      :tomorrow => response['locations']["#{city}"]["values"][1]["temp"],
      :third_day => response['locations']["#{city}"]["values"][2]["temp"]
    }
  end

end

class OpenWeatherApi < WeatherApi

  def forecast(latitude, longitude)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&appid=#{API_KEY_OPEN_WEATHER}").parsed_response
    report = {
      :description => response['weather'][0]['description'],
      :temperature => ((response['main']['temp'].to_f) - 273.15).round.to_s
    }
    p report
  end

end
