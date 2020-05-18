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

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var place: UILabel!
    
    let locationManger = CLLocationManager()
    var weatherManager = WeatherManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.text = getDayMonthYear()
        temperature.text = temp()
        
        locationManger.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManger.startUpdatingLocation()
            
        }
    }
    
    
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
    
    func temp() -> String {
        let temperature = 87
        let tempString = "\(temperature) °F"
        return tempString
    }

//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let locValue:CLLocationCoordinate2D = manager.location?.coordinate else { return }
//        print("locations : \(locValue.latitude) \(locValue.longitude)")
//    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location: CLLocation = manager.location else { return }
        fetchCityAndCountry(from: location) { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.place.text = city
            self.weatherManager.fetchWeather(cityName: city)
            print(city + ", " + country)
        }
    }
    
    func fetchCityAndCountry(from location:CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) {placemarks, error in
            completion (placemarks?.first?.locality,
                        placemarks?.first?.country,
                        error)
        }
    }
}

