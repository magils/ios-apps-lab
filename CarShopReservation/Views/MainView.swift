//
//  ContentView.swift
//  LittleRestaurantReservation
//
//  Created by Moises Gil on 12/13/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ShopsView()
                .tabItem {
                    Label("Locations", systemImage: "globe")
                }

            AppointmentListView()
                .tabItem {
                    Label("Appointments", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    MainView()
}
