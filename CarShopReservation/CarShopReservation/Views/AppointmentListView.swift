//
//  AppointmentListView.swift
//  CarShopReservation
//
//  Created by Moises Gil on 1/11/26.
//

import SwiftUI

struct AppointmentListView: View {
    @StateObject private var controller = ReservationController.shared
    
    var body: some View {
        NavigationView{
            List( controller.getAppointments(), id: \.self) { appointment in
                NavigationLink(destination: AppointmentDetailView(appointment: appointment)) {
                    VStack(alignment: .leading) {
                        HStack{
                            Image(systemName: appointment.serviceDetail.serviceType.icon)
                            
                            Text("Service: \(appointment.serviceDetail.serviceType.rawValue)")
                                .font(.title2)
                        }
                        
                        Text("Date: \(appointment.reservationDate.formatted(date: .long, time: .shortened))")
                            .font(.subheadline)
                        
                        Text("Customer: \(appointment.customer.fullName)")
                            .font(.subheadline)
                    }
                }
            }.navigationTitle(Text("Appointments"))
        }
    }
}

#Preview {
    AppointmentListView()
}
