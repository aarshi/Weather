//
//  WeatherManager.swift
//  Weather
//
//  Created by Shivam Chhatwal on 5/14/20.
//  Copyright © 2020 Shivam Chhatwal. All rights reserved.
//

import Foundation

struct WeatherManager {
    //This is same as copied from web browser
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=a0e3b2ad195d7be1180fae6161106a64&units=imperial"
    
    //To append dynamic stuff in the url
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a URL : Creating a URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession : Opening a browser window
            let urlSession = URLSession(configuration: .default)
            
            //3. Give URLSession a task : Putting URL in browser bar and task is to fetch data
            let task = urlSession.dataTask(with: url) { (data, urlResponse, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    //Now here data is coming as JSON but we do not want to get java objects out of it rather we want swift objects
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString!)
                    self.parseJSON(weatherDataInfo: safeData)
                }
            }
            
            //4. Start the task : Click "Enter"
            task.resume()
        }
    }
    
    func parseJSON(weatherDataInfo: Data) {
        let decoder = JSONDecoder()
        //This method expects a data type rather than an object, so we need to put ".self" to reference the type object wich turns cityName into data type that I am passing in
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherDataInfo)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
        
        //If you see this method, it is marked with:
        //1. Throws keyword which means throw an error if something goes wrong, so we need to mark it with try keyword
        //2. And wrap it in a do block
        //3. And then we have a catch block that will catch the error
        
    }
}



