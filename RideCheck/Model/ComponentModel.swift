//
//  ComponentModel.swift
//  RideCheck
//
//  Created by Dhafindra Razaqa Stefano on 01/10/25.
//

import Foundation

struct ComponentModel: Identifiable {
    let id: UUID = UUID()
    var name: String
    var image: String
    var mileage: Int
    var lifespan: Int
    var lastService: Int
    var status: String
    var maintenanceHistory: [Date]
}
