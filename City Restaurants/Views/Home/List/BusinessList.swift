//
//  BusinessList.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 09.09.2022.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSection(title: "Restaurants", businesses: model.restaurants)
                
                BusinessSection(title: "Sights", businesses: model.sights)
                
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
