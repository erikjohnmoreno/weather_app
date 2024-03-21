class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5/weather'

  def self.fetch_weather(city)
    response = get('https://api.openweathermap.org/data/2.5/weather', query: { q: city, appid: ENV['openweathermap_api_key'] })
    return JSON.parse(response.body) if response.success?
    nil
  end
end