//
//  LaunchView.swift
//  City Restaurants
//
//  Created by Alex Ivanescu on 03.09.2022.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        // Detect the authorization status of geolocating the user
        if model.authorizationState == .notDetermined {
            // If undetermined, show onboarding
            OnboardingView()
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            // If approved, show the home view
            HomeView()
        }
        else {
            // If denied show deniew view
            LocationDeniedView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
