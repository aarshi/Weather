# Weather iOS App

User can see a list of cities and on selecting a city, weather information for that city should be displayed. 


API Information
 
# 1. CURRENT WEATHER
 
# Request –

 https://api.openweathermap.org/data/2.5/weather?q={city name}&appid=42a1771a0b787bf12e734ada0cfc80cb 

Eg - https://api.openweathermap.org/data/2.5/weather?q=London&appid=42a1771a0b787bf12e734ada0cfc80cb 


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



# 2. UPCOMING WEATHER
 
# Request –

https://api.openweathermap.org/data/2.5/forecast/daily?lat=latitude&lon=-longitude&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb 

Eg - https://api.openweathermap.org/data/2.5/forecast/daily?lat=39.7392&lon=-104.9903&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb


# Response –


{  
   "city":{  
      "id":5419384,
      "name":"Denver",
      "coord":{  
         "lon":-104.9848,
         "lat":39.7392
      },
      "country":"US",
      "population":600158
   },
   "cod":"200",
   "message":12.1018199,
   "cnt":10,
   "list":[  
      {  
         "dt":1524333600,
         "temp":{  
            "day":276.26,
            "min":270.56,
            "max":276.26,
            "night":270.56,
            "eve":276.26,
            "morn":276.26
         },
         "pressure":820.11,
         "humidity":94,
         "weather":[  
            {  
               "id":600,
               "main":"Snow",
               "description":"light snow",
               "icon":"13d"
            }
         ],
         "speed":0.56,
         "deg":291,
         "clouds":88,
         "rain":0.63,
         "snow":0.13
      },
      {  
         "dt":1524420000,
         "temp":{  
            "day":287.87,
            "min":269.12,
            "max":288.39,
            "night":277.1,
            "eve":287.19,
            "morn":269.12
         },
         "pressure":819.99,
         "humidity":64,
         "weather":[  
            {  
               "id":500,
               "main":"Rain",
               "description":"light rain",
               "icon":"10d"
            }
         ],
         "speed":2.96,
         "deg":17,
         "clouds":0,
         "rain":0.26
      },
      {  
         "dt":1524506400,
         "temp":{  
            "day":291.34,
            "min":273.75,
            "max":291.34,
            "night":279.07,
            "eve":287.44,
            "morn":273.75
         },
         "pressure":817.11,
         "humidity":58,
         "weather":[  
            {  
               "id":500,
               "main":"Rain",
               "description":"light rain",
               "icon":"10d"
            }
         ],
         "speed":1.17,
         "deg":198,
         "clouds":0,
         "rain":2.32
      },
      {  
         "dt":1524592800,
         "temp":{  
            "day":276.39,
            "min":272.99,
            "max":276.39,
            "night":272.99,
            "eve":275.21,
            "morn":274.76
         },
         "pressure":820.44,
         "humidity":0,
         "weather":[  
            {  
               "id":601,
               "main":"Snow",
               "description":"snow",
               "icon":"13d"
            }
         ],
         "speed":7.23,
         "deg":1,
         "clouds":100,
         "rain":4.63,
         "snow":4.56
      },
      {  
         "dt":1524679200,
         "temp":{  
            "day":281.02,
            "min":270.87,
            "max":286.41,
            "night":275.05,
            "eve":286.41,
            "morn":270.87
         },
         "pressure":819.39,
         "humidity":0,
         "weather":[  
            {  
               "id":600,
               "main":"Snow",
               "description":"light snow",
               "icon":"13d"
            }
         ],
         "speed":1.22,
         "deg":166,
         "clouds":0,
         "snow":0.2
      },
      {  
         "dt":1524765600,
         "temp":{  
            "day":283.53,
            "min":271.34,
            "max":285.28,
            "night":273.24,
            "eve":285.28,
            "morn":271.34
         },
         "pressure":819.38,
         "humidity":0,
         "weather":[  
            {  
               "id":800,
               "main":"Clear",
               "description":"sky is clear",
               "icon":"01d"
            }
         ],
         "speed":1.56,
         "deg":61,
         "clouds":2,
         "rain":0.55,
         "snow":0.01
      },
      {  
         "dt":1524852000,
         "temp":{  
            "day":289.31,
            "min":269.99,
            "max":291.91,
            "night":278.54,
            "eve":291.91,
            "morn":269.99
         },
         "pressure":816.79,
         "humidity":0,
         "weather":[  
            {  
               "id":800,
               "main":"Clear",
               "description":"sky is clear",
               "icon":"01d"
            }
         ],
         "speed":1.74,
         "deg":251,
         "clouds":0
      },
      {  
         "dt":1524938400,
         "temp":{  
            "day":294.03,
            "min":275.19,
            "max":294.03,
            "night":279.07,
            "eve":292.24,
            "morn":275.19
         },
         "pressure":812.66,
         "humidity":0,
         "weather":[  
            {  
               "id":500,
               "main":"Rain",
               "description":"light rain",
               "icon":"10d"
            }
         ],
         "speed":2.19,
         "deg":312,
         "clouds":3,
         "rain":0.99
      },
      {  
         "dt":1525024800,
         "temp":{  
            "day":295.26,
            "min":276.57,
            "max":295.26,
            "night":282.99,
            "eve":292.95,
            "morn":276.57
         },
         "pressure":812.84,
         "humidity":0,
         "weather":[  
            {  
               "id":500,
               "main":"Rain",
               "description":"light rain",
               "icon":"10d"
            }
         ],
         "speed":1.5,
         "deg":302,
         "clouds":10,
         "rain":2.67
      },
      {  
         "dt":1525111200,
         "temp":{  
            "day":292.32,
            "min":280.13,
            "max":292.32,
            "night":281.83,
            "eve":288.82,
            "morn":280.13
         },
         "pressure":812.17,
         "humidity":0,
         "weather":[  
            {  
               "id":502,
               "main":"Rain",
               "description":"heavy intensity rain",
               "icon":"10d"
            }
         ],
         "speed":2.86,
         "deg":32,
         "clouds":31,
         "rain":17.18
      }
   ]
}
