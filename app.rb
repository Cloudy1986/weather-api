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

  run! if app_file == $0
end
