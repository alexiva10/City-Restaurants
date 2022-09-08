//
//  BusinessSearch.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 08.09.2022.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
