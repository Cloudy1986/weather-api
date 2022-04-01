require 'sinatra/base'
require 'sinatra/reloader'
require './lib/weather_api'

class WeatherChecker < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :homepage
  end

  get '/visual-crossing-api' do
    @london_temps = VisualCrossingApi.new.forecast('London')
    @manchester_temps = VisualCrossingApi.new.forecast('Manchester')
    @sunderland_temps = VisualCrossingApi.new.forecast('Sunderland')
    erb :visual_crossing_api
  end

  get '/open-weather-api' do
    @london_weather = OpenWeatherApi.new.forecast('51', '0')
    p @london_weather
    @manchester_weather = OpenWeatherApi.new.forecast('53', '2')
    p @manchester_weather
    @sunderland_weather = OpenWeatherApi.new.forecast('54', '1')
    p @sunderland_weather
    erb :open_weather_api
  end

  run! if app_file == $0
end
