//
//  VehicleModel.swift
//  RideCheck
//
//  Created by Dhafindra Razaqa Stefano on 01/10/25.
//

import Foundation

struct VehicleModel: Identifiable {
    let id: UUID = UUID()
    var components: [ComponentModel]
    var mileage: Int
    var image: String
    var health: Int
}
