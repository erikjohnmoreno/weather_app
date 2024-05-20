require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
  describe 'GET /weather/:location' do
    let(:location) { 'makati' }
    let(:weather_data) do
      {
        'weather' => { 'description' => 'Sunny', 'icon' => '01d' },
        'main' => { 'temp' => 75.0, 'humidity' => 60 },
        'wind' => { 'speed' => 5.5 }
      }
    end

    context 'when weather data is found' do
      before do
        allow(WeatherService).to receive(:fetch_weather).with(location).and_return(weather_data)
      end
      it 'returns the weather data for the specified location and saves it' do
        get :show, params: {location: location}
        expect(JSON.parse(response.body)["location"] == "makati").to eql true
        expect(JSON.parse(response.body)["weather"]["description"] == "Sunny").to eql true
        expect(JSON.parse(response.body)["weather"]["icon"] == "01d").to eql true
        expect(JSON.parse(response.body)["temperature"] == 75.0).to eql true
        expect(JSON.parse(response.body)["humidity"] == 60).to eql true
        expect(JSON.parse(response.body)["wind_speed"] == 5.5).to eql true
        expect(WeatherDatum.count > 0).to eql true
      end
    end

  end
end