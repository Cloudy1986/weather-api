require 'sinatra/base'
require 'sinatra/reloader'
require 'httparty'
require 'pp'
require './lib/visualcrossingapi'

class WeatherChecker < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @london_temps = VisualCrossingApi.new('London').forecast
    @manchester_temps = VisualCrossingApi.new('Manchester').forecast
    @sunderland_temps = VisualCrossingApi.new('Sunderland').forecast
    erb :homepage
  end

  run! if app_file == $0
end
