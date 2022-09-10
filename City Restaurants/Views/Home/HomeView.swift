//
//  HomeView.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 09.09.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                // Show map or list
                if !isMapShowing {
                    // Show list
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text("Bucuresti")
                            Spacer()
                            Text("Switch to map view")
                        }
                        Divider()
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // Show map
                }
            }
        } else {
            ProgressView()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
