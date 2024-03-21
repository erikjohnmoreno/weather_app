# README
  
## Overview

WEATHER API APPLICATION - provides basic weather data

## API

### Endpoint

**GET /weather**

Retrieves weather data of the given location.

### Request Format

- **Params:**
  - **location:** (string: required) - name of the location for which weather data is requested.

### Response Format

- **200 OK:**
  ```json
  {
    "location":"makati",
    "weather":[
      {
        "id":803,
        "main":"Clouds",
        "description":"broken clouds",
        "icon":"04d"
      }
    ],
    "temperature":301.45,
    "humidity":70,
    "wind_speed":5.14
  }

- **404 Not Found:**
  ```json
  {
    "error":"Weather data not found"
  }


### SETUP
  for this I use signoz to check for traces

  **SETUP SIGNOZ** 
    - git clone -b main https://github.com/SigNoz/signoz.git
    - cd signoz/deploy/
    - ./install.sh

  **SETUP APPLICATION**
    - git clone :this_repo
    - cd weather_app
    - bundle install
    - set environment variables on application.yml
      - openweathermap_api_key: 2f83f95a4d078096a1b777fdb340bccd
      - OTEL_EXPORTER: otlp
      - OTEL_SERVICE_NAME: "weatherApp"
      - OTEL_EXPORTER_OTLP_ENDPOINT: http://localhost:4318
      - OTEL_RESOURCE_ATTRIBUTES: application=weatherApp
    - bundle exec rails s
    - open your web browser and make requests to: http://localhost:3000/weather/:location


  


