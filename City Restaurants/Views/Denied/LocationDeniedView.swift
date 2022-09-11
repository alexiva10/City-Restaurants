//
//  LocationDeniedView.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 11.09.2022.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColor = Color(red: 34/225, green: 141/225, blue: 138/225)
    
    var body: some View {
        
        VStack (spacing: 20) {
            Spacer()
            
            Text("Whooops!")
                .font(.title)
            
            Text("We need to acces your location to show you the best places in your city. Go to Settings and change your decision.")
            
            Spacer()
            
            Button {
                // Open settings by getting the settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            } label: {
                
                ZStack {
                    Rectangle()
                    foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                }
            }
            .padding()

            Spacer()
        }
        .padding()
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
        
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
