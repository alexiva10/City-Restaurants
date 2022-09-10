//
//  Business.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 08.09.2022.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id:String?
    var alias:String?
    var name:String?
    var imageUrl:String?
    var isClosed:Bool?
    var url:String?
    var reviewCount:Int?
    var categories:[Category]?
    var rating:Double?
    var coordinates:Coordinate?
    var transactions:[String]?
    var price:String?
    var location:Location?
    var phone:String?
    var displayPhone:String?
    var distance:Double?
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
    }
    
    func getImageData() {
        guard imageUrl != nil else {
            return
        }
        if let url = URL(string: imageUrl!) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    
                    DispatchQueue.main.async {
                        self.imageData = data!
                    }
                }
            }
            dataTask.resume()
        }
    }
}

struct Category: Decodable {
    var alias:String?
    var title:String?
}

struct Coordinate: Decodable {
    var latitude:Double?
    var longitude:Double?
}

struct Location: Decodable {
    var adress1:String?
    var adress2:String?
    var adress3:String?
    var city:String?
    var zipCode:String?
    var country:String?
    var state:String?
    var displayAddress:[String]?
    
    enum CodingKeys: String, CodingKey {
        case zipCode = "zip_code"
        case displayAddress = "display_address"
        
        case adress1
        case adress2
        case adress3
        case city
        case country
        case state
    }
}
