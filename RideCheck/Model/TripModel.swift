//
//  TripModel.swift
//  RideCheck
//
//  Created by Dhafindra Razaqa Stefano on 10/10/25.
//

import Foundation

struct TripModel: Identifiable {
    let id: UUID = UUID()
    var time: Date
    var distance: Double
    var destination: String
    var origin: String
    var isConfirmed: Bool
}
