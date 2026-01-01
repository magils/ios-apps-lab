//
//  ReservationController.swift
//  CarShopReservation
//
//  Created by Moises Gil on 12/30/25.
//

import Foundation

class ReservationController {
    private var reservations = [Reservation]()
    
    func addReservation(_ reservation: Reservation){
        self.reservations.append(reservation)
    }
    
    func getReservations() -> [Reservation] {
        return self.reservations
    }
}
