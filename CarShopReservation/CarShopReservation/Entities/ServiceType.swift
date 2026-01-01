//
//  ServiceType.swift
//  CarShopReservation
//
//  Created by Moises Gil on 12/13/25.
//

import Foundation

enum ServiceType: String, CaseIterable {
    case oilChange = "Oil Change"
    case tireRotation = "Tire Rotation"
    case batteryCheck = "Battery Check"
    case transmissionService = "Transmission Service"
    case other = "Other"
}
