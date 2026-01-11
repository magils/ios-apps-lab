//
//  ReservationController.swift
//  CarShopReservation
//
//  Created by Moises Gil on 12/30/25.
//

import Foundation

class ReservationController {
    static let shared = ReservationController()
    private var reservations = [Appointment]()
    
    private init() {}
    
    func addReservation(_ reservation: Appointment){
        self.reservations.append(reservation)
    }
    
    func getReservations() -> [Appointment] {
        return self.reservations
    }
}
