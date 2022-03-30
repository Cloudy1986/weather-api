require 'visualcrossingapi'

describe VisualCrossingApi do

  describe "initialization" do
    it 'creates an object when passed an argument' do
      expect(VisualCrossingApi.new('London')).to be_a VisualCrossingApi
    end
  end

  describe "#forecast" do
    it 'returns a hash with temperatures for today, tomorrow and a third day' do
      london_temperatures = VisualCrossingApi.new('London').forecast
      expect(london_temperatures).to be_a Hash
      expect(london_temperatures.key?(:today)).to eq true
      expect(london_temperatures.key?(:tomorrow)).to eq true
      expect(london_temperatures.key?(:third_day)).to eq true
    end
  end
end