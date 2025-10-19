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
            Tab("Dashboard", systemImage: "house.fill"){
                DashboardView()
                    .navigationTitle("Dashboard")
            }
            
            Tab("Trip History", systemImage: "map.fill"){
                TripsView().navigationTitle(Text("Trip History"))
            }
        }
    }
}

#Preview {
    ContentView()
}
