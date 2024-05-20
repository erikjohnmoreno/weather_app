class CreateWeatherData < ActiveRecord::Migration[7.1]
  def change
    create_table :weather_data do |t|
      t.string :location
      t.jsonb :weather
      t.float :temperature
      t.integer :humidity
      t.float :wind_speed

      t.timestamps
    end
  end
end
