require 'sinatra/base'
require 'sinatra/reloader'
require 'httparty'
require 'pp'

class WeatherChecker < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @forecast = HTTParty.get('https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations=London&aggregateHours=24&unitGroup=uk&contentType=json&key=V5WEMRHCCN957ZLLHAZ8UGW9E').parsed_response
    pp @today = @forecast['locations']["London"]["values"][0]["temp"]
    pp @tomorrow = @forecast['locations']["London"]["values"][1]["temp"]
    pp @third_day = @forecast['locations']["London"]["values"][2]["temp"]
    erb :homepage
  end

  run! if app_file == $0
end
