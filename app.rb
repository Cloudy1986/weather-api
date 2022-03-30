require 'sinatra/base'
require 'sinatra/reloader'
require './lib/visualcrossingapi'

class WeatherChecker < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :homepage
  end

  get '/visual-crossing-api' do
    @london_temps = VisualCrossingApi.new('London').forecast
    @manchester_temps = VisualCrossingApi.new('Manchester').forecast
    @sunderland_temps = VisualCrossingApi.new('Sunderland').forecast
    erb :visual_crossing_api
  end

  run! if app_file == $0
end
