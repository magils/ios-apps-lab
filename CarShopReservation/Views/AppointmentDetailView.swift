//
//  AppointmentDetailView.swift
//  CarShopReservation
//
//  Created by Moises Gil on 1/18/26.
//

import SwiftUI

struct AppointmentDetailView: View {
    
//    @State var sampleText = "Hello, World!"
    let appointment: Appointment
    
    init(appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section(header: Text("Appoitnment Info")) {
                        HStack {
                            Text("Location: ")
                            Text(appointment.shopLocation.city)
                        }
                        HStack {
                            Text("Date/Time: ")
                            Text(appointment.reservationDate.formatted(date: .abbreviated, time: .shortened))
                        }
                    }
                    Section(header: Text("Customer Info")) {
                        HStack{
                            Text("Full Name: ")
                            Text(appointment.customer.fullName)
                        }
                        HStack {
                            Text("Email: ")
                            Text(appointment.customer.email)
                        }
                    }
                    
                    Section(header: Text("Car Info")) {
                        Text("\(appointment.car.year) \(appointment.car.brand) \(appointment.car.model)")
                        Text("\(appointment.car.mileage) Miles")
                    }
                    
                    Section(header: Text("Service Detail")) {
                        HStack{
                            Text("Service Type: ")
                            HStack{
                                Image(systemName: appointment.serviceDetail.serviceType.icon)
                                Text(appointment.serviceDetail.serviceType.rawValue)
                            }
                        }
                        HStack{
                            Text("Category: ")
                            HStack{
                                Image(systemName: appointment.serviceDetail.serviceType.categoryIcon)
                                Text(appointment.serviceDetail.serviceType.categoryName)
                            }
                        }
                        
                        VStack {
                            Text("Customer states...")
                            Text(appointment.serviceDetail.customerStatement)
                        }
                    }
                }
                
                Button("Cancel Appointment") {
                    
                }.padding()
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }
        }.navigationTitle(Text("Appointment Detail"))
    }
}

#Preview {
    let location = ShopLocation(city: "San Francisco", address: "NV 33, Los Gatos", phoneNumber: "415-886-4514")
    let sampleCustomer = Customer(fullName: "John Doe", phoneNumber: "444-555-6666", email: "jdoe@example.com")
    let sampleCar = Car(brand: "Toyota", model: "Corolla", year: 1993, isUnknown: false, unknownName: "")
    let sampleServiceDetail = ServiceDetail(serviceType: .other, customerStatement: "This is a sample")
    let sampleAppointment = Appointment(customer: sampleCustomer, reservationDate: Date(), car: sampleCar, serviceDetail: sampleServiceDetail, shopLocation: location)
    AppointmentDetailView(appointment: sampleAppointment)
}
