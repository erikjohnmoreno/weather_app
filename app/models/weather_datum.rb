class WeatherDatum < ApplicationRecord
  validates :location, presence: true
  validates :weather, presence: true
  validates :temperature, presence: true
  validates :humidity, presence: true
  validates :wind_speed, presence: true
end
