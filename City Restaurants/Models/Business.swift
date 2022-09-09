//
//  Business.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 08.09.2022.
//

import Foundation

struct Business: Decodable, Identifiable {
    
    var id:String?
    var alias:String?
    var name:String?
    var image_url:String?
    var is_closed:Bool?
    var url:String?
    var review_count:Int?
    var categories:[Category]?
    var rating:Double?
    var coordinates:Coordinate?
    var transactions:[String]?
    var price:String?
    var location:Location?
    var phone:String?
    var display_phone:String?
    var distance:Double?
    
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
    var zip_code:String?
    var country:String?
    var state:String?
    var display_adress:[String]?
}
