//
//  City_RestaurantsApp.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 03.09.2022.
//

import SwiftUI

@main
struct CityRestaurantsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView().environmentObject(ContentModel())
        }
    }
}
