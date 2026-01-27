//
//  ReservationController.swift
//  CarShopReservation
//
//  Created by Moises Gil on 12/30/25.
//

import Foundation
import Combine

class ReservationController: ObservableObject {
    static let shared = ReservationController()
    @Published var appointments = [Appointment]()
    
    private init() {
        let location = ShopLocation(city: "San Francisco", address: "NV 33, Los Gatos", phoneNumber: "415-886-4514")
        var sampleCustomer = Customer(fullName: "John Doe", phoneNumber: "444-555-6666", email: "jdoe@example.com")
        var sampleCar = Car(brand: "Toyota", model: "Corolla", year: 1993, isUnknown: false, unknownName: "")
        var sampleServiceDetail = ServiceDetail(serviceType: .other, customerStatement: "This is a sample")
        var sampleAppointment = Appointment(customer: sampleCustomer, reservationDate: Date(), car: sampleCar, serviceDetail: sampleServiceDetail, shopLocation: location)
        appointments.append(sampleAppointment)
        
        sampleCustomer = Customer(fullName: "Mary Doe", phoneNumber: "444-555-7777", email: "mdoe@example.com")
        sampleCar = Car(brand: "Toyota", model: "Camry", year: 1993, isUnknown: false, unknownName: "")
        sampleServiceDetail = ServiceDetail(serviceType: .oilChange, customerStatement: "This is a sample")
        sampleAppointment = Appointment(customer: sampleCustomer, reservationDate: Date(), car: sampleCar, serviceDetail: sampleServiceDetail, shopLocation: location)
        appointments.append(sampleAppointment)
        
    }
    
    func addReservation(_ reservation: Appointment){
        self.appointments.append(reservation)
    }
    
    func getAppointments() -> [Appointment] {
        return self.appointments
    }
}
