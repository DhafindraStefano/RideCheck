//
//  ContentView.swift
//  RideCheck
//
//  Created by Dhafindra Razaqa Stefano on 01/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Garage", systemImage: "door.garage.open"){
                GarageView()
            }
            
            Tab("Trip History", systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90"){
                TripHistoryView()
            }
        }
    }
}

#Preview {
    ContentView()
}
