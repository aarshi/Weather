# Weather
iOS Weather app

User can see a list of cities and on selecting a city, weather information for that city should be displayed. 


API Information
 
# Request –
api.openweathermap.org/data/2.5/weather?q={city name}&appid=42a1771a0b787bf12e734ada0cfc80cb 

Eg - http://api.openweathermap.org/data/2.5/weather?q=London&appid=42a1771a0b787bf12e734ada0cfc80cb 


# Response –
{  
   "coord":{  
      "lon":-0.13,
      "lat":51.51
   },
   "weather":[  
      {  
         "id":701,
         "main":"Mist",
         "description":"mist",
         "icon":"50n"
      }
   ],
   "base":"stations",
   "main":{  
      "temp":286.9,
      "pressure":1013,
      "humidity":100,
      "temp_min":286.15,
      "temp_max":287.15
   },
   "visibility":10000,
   "wind":{  
      "speed":2.6,
      "deg":50
   },
   "clouds":{  
      "all":48
   },
   "dt":1524358200,
   "sys":{  
      "type":1,
      "id":5093,
      "message":0.0061,
      "country":"GB",
      "sunrise":1524372618,
      "sunset":1524424131
   },
   "id":2643743,
   "name":"London",
   "cod":200
}
