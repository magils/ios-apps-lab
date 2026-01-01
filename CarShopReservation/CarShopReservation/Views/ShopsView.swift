//
//  RestaurantView.swift
//  LittleRestaurantReservation
//
//  Created by Moises Gil on 12/13/25.
//

import SwiftUI

struct ShopsView: View {
    let data = Data()

    var body: some View {
        VStack {
            NavigationView {
                List(data.shops, id: \.self) { location in
                    NavigationLink(destination: ReservationFormView()) {
                        VStack {
                            LocationSelectView(location)
                        }
                    }
                }
                .navigationTitle(Text("Locations"))
            }
        }
    }
}

#Preview {
    ShopsView()
}
