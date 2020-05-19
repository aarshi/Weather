//
//  ViewController.swift
//  Weather
//
//  Created by Shivam Chhatwal on 5/6/20.
//  Copyright © 2020 Shivam Chhatwal. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, WeatherManagerDelegate {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var tempDescription: UILabel!
    @IBOutlet weak var tempImageView: UIImageView!
    
    let locationManger = CLLocationManager()
    var weatherManager = WeatherManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        date.text = getDayMonthYear()
        //temperature.text = temp()
        
        locationManger.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManger.startUpdatingLocation()
            
        }
    }
    
    //Date
    func getDayMonthYear() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        //Day
        dateFormatter.dateFormat = "EEEE"
        let dayString = dateFormatter.string(from: date)
        
        //Date
        dateFormatter.dateFormat = "MMMM dd YYYY"
        let fullDateString = dateFormatter.string(from: date)
        
        
        let dateString = "\(dayString), \(fullDateString)"
        return dateString
    }
    
//    func temp() -> String {
//        let temperature = 87
//        let tempString = "\(temperature) °F"
//        return tempString
//    }

//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue:CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations : \(locValue.latitude) \(locValue.longitude)")
//    }
    
    //Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        fetchCityAndCountry(from: location) { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.place.text = city
            self.weatherManager.fetchWeather(cityName: city)
            //print(city + ", " + country)
        }
    }
    
    func fetchCityAndCountry(from location:CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) {placemarks, error in
            completion (placemarks?.first?.locality,
                        placemarks?.first?.country,
                        error)
        }
    }
    
    func didUpdateWeather(weather: WeatherData)  {
        let tempString = String(weather.main.temp)
        DispatchQueue.main.async {
            self.temperature.text = "\(tempString) °F"
            self.tempDescription.text = weather.weather[0].description
            //self.tempImageView.image = myImageView(conditionID: weather.weather[0].id)
            if #available(iOS 13.0, *) {
                self.tempImageView.image = UIImage(systemName: self.myImageView(conditionID: weather.weather[0].id))
            } else {
                // Fallback on earlier versions
            }
        }        
    }
    
    func didUpdateError(error: Error) {
        print(error)
    }
    
    func myImageView(conditionID: Int) -> String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "Cloud"
        }
    }
    
//    func stringtoImage() -> UIImage? {
//        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
//        return UIImage(data: data)
//        } else {
//            return nil
//        }
//    }
}


//Delegate Pattern:
//A. Manager:
//1. Create protocol with method to be executed by VC
//2. Create a delegate property, and as soon as VC will self delegate as self(point 2 below), this property will have value and will not be nil
//3. call the function with passing the data

//B. ViewController:
//1. Include delegate at class level
//2. Set delegate to self (meaning VC is telling weathermanager that i will perform your work, please delegate it to me)
//3. Write/define the function here with functionality VC wants to perform

