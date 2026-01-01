//
//  Reservation.swift
//  LittleRestaurantReservation
//
//  Created by Moises Gil on 12/13/25.
//
import Foundation

struct Reservation {
    let id = UUID()
    var customer: Customer
    var reservationDate: Date
    var car : Car
    var serviceDetail: ServiceDetail
}
