//
//  LocationSelectView.swift
//  LittleRestaurantReservation
//
//  Created by Moises Gil on 12/13/25.
//

import SwiftUI

struct LocationSelectView: View {
    private var location: ShopLocation
    
    init(_ location: ShopLocation) {
        self.location = location
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(location.city)
                .font(.title2)

            Text("\(location.phoneNumber)  \(location.address)").font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    LocationSelectView(ShopLocation(city: "New York", address: "5th Ave.", phoneNumber: "375-846-4514"))

}
