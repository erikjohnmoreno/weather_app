class WeatherController < ApplicationController
  def show
    location = params[:location]
    weather_data = WeatherService.fetch_weather(location)

    if weather_data
      WeatherDatum.create!(
        location: location,
        weather: weather_data['weather'],
        temperature: weather_data['main']['temp'],
        humidity: weather_data['main']['humidity'],
        wind_speed: weather_data['wind']['speed']
      )
      render json: { 
        location: location,
        weather: weather_data['weather'],
        temperature: weather_data['main']['temp'],
        humidity: weather_data['main']['humidity'], 
        wind_speed: weather_data['wind']['speed'] 
      }
    else
      render json: { error: 'Weather data not found' }, status: :not_found
    end
  end
end
