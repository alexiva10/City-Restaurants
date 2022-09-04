//
//  ContentModel.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 04.09.2022.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, ObservableObject,  CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    override init() {
        
        // init method of NSObject
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
       
    }
    
    // MARK - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            // Start geolocating the user after we have acces
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // We don't have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Gives us the location of the user
        
        // Stop requesting the location after we get it once
        locationManager.stopUpdatingLocation()
    }
}
