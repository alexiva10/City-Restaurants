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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
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
        // Update the authState property
        authorizationState = locationManager.authorizationStatus
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
        let userLocation = locations.first
        
        if userLocation != nil {
            // We have a location
            // Stop requesting the location after we get it once
            locationManager.stopUpdatingLocation()
            
            // If we have the coordinates of the user, send into Yelp API
            getBusinesses(category: Constants.artsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
        }
        
    }
    
    // MARK: Yelp API methods
    
    func getBusinesses(category:String, location:CLLocation) {
        // Create URL
        /*let urlString =
        "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        let url = URL(string: urlString)*/
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        var url = urlComponents?.url
        
        if let url = url {
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            // Get URLSession
            let session = URLSession.shared
            // Create Data Task
            let dataTask = session.dataTask(with: request) { data, response, error in
                // Check there is not an error
                if error == nil {
                    // Parse json
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            // Assign result to the property
                            if category == Constants.artsKey {
                                self.sights = result.businesses
                            } else if category == Constants.restaurantsKey {
                                self.restaurants = result.businesses
                            }
                            // For more categories try switch-case
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            // Start Data Task
            dataTask.resume()
        }
    }
}
