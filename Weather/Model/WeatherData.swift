//
//  WeatherData.swift
//  Weather
//
//  Created by Shivam Chhatwal on 5/15/20.
//  Copyright © 2020 Shivam Chhatwal. All rights reserved.
//

import Foundation

//We need to conform weatherdata with decodable protocol, which means weatherdata can turn itslef to a data type from an external representation
struct WeatherData:Decodable {
    let name: String
    let main : Main
    let weather : [Weather]
}

struct Weather: Decodable {
    let description : String
    let id: Int
}

struct Main:Decodable {
    let temp : Double
}
