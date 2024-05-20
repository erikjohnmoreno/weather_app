FactoryBot.define do
  factory :weather_datum do
    location { "makati" }
    weather { { description: "Sunny", icon: "01d" } }
    temperature { 75.0 }
    humidity { 60 }
    wind_speed { 5.5 }
  end
end
