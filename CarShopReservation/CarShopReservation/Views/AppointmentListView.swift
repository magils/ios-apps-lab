//
//  AppointmentListView.swift
//  CarShopReservation
//
//  Created by Moises Gil on 1/11/26.
//

import SwiftUI

struct AppointmentListView: View {
    var body: some View {
        List(ReservationController.shared.getReservations(), id: \.self) { appointment in
            Text("\(appointment.car.brand)")
        }
    }
}

#Preview {
    AppointmentListView()
}
