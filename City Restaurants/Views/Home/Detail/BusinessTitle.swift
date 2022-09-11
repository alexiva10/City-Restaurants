//
//  BusinessTitle.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 10.09.2022.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
        
            // Business Name
            Text(business.name!)
                .font(.title2)
                .bold()

            // Adress
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { displayLine in
                    Text(displayLine)
                        .foregroundColor(.black)
                }
            }
            // Rating
            Image("regular_\(business.rating ?? 0)")

        }
    }
}

