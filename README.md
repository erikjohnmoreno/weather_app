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


## SETUP

For monitoring the application traces, we'll be using Signoz. Follow the steps below to set up Signoz and the application:

**SETUP SIGNOZ**
1. Clone the Signoz repository:
```bash
  git clone -b main https://github.com/SigNoz/signoz.git
```
2. Navigate to the deployment directory:
```bash
  cd signoz/deploy/
```
3. run
```bash
  ./install.sh
```


**SETUP APPLICATION**
1. Clone repo
```bash
   git clone https://github.com/erikjohnmoreno/weather_app.git
```
2. Follow this steps:
```bash
  cd weather_app
```
```bash
  bundle install
```
  copy paste application.yml:
```bash
  openweathermap_api_key: 2f83f95a4d078096a1b777fdb340bccd
  OTEL_EXPORTER: otlp
  OTEL_SERVICE_NAME: "weatherApp"
  OTEL_EXPORTER_OTLP_ENDPOINT: http://localhost:4318
  OTEL_RESOURCE_ATTRIBUTES: application=weatherApp
```
```bash
  bundle exec rails s
```

3. open your web browser and make requests to:
   ```http://localhost:3000/weather/:location```


  


