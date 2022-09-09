//
//  BusinessSection.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 09.09.2022.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    var body: some View {
        
        Section (header: BusinessSectionHeader(title: title)) {
            ForEach(businesses) { business in
                Text(business.name ?? "")
                Divider()
            }
        }
    }
}

/*struct BusinessSection_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSection()
    }
}*/
