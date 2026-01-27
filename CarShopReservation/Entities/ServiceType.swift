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
    
    var icon: String {
        switch self {
        case .oilChange:
            return "oilcan"
        case .tireRotation:
            return "arrow.triangle.2.circlepath.circle"
        case .batteryCheck:
            return "minus.plus.batteryblock"
        case .transmissionService:
            return "gearshape"
        case .other:
            return "ellipsis.circle"
        }
    }
    
    var categoryIcon: String {
        switch self {
        case .oilChange, .tireRotation, .transmissionService:
            return "arrow.triangle.2.circlepath.circle"
        case .batteryCheck:
            return "magnifyingglass"
        default:
            return "ellipsis.circle"
        }
    }
    
    var categoryName: String {
        switch self {
        case .oilChange, .tireRotation, .transmissionService:
            return "Maintenance"
        case .batteryCheck:
            return "Inspection"
        default:
            return "Other"
        }
    }
}
