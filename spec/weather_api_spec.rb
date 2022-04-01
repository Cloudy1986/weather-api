require 'weather_api'

describe WeatherApi do

  describe "VisualCrossingApi initialization" do
    it 'creates an object when passed an argument' do
      expect(VisualCrossingApi.new).to be_a VisualCrossingApi
    end
  end

  describe "#forecast" do
    it 'returns a hash with temperatures for today, tomorrow and a third day' do
      london_temperatures = VisualCrossingApi.new.forecast('London')
      expect(london_temperatures).to be_a Hash
      expect(london_temperatures.key?(:today)).to eq true
      expect(london_temperatures.key?(:tomorrow)).to eq true
      expect(london_temperatures.key?(:third_day)).to eq true
    end
  end
end