//
//  DashboardView.swift
//  RideCheck
//
//  Created by Dhafindra Razaqa Stefano on 16/10/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack{
            Text("This is Dashboard view")
            Image(systemName: "car.fill")
            
            NavigationLink {
                ComponentView()
            } label: {
                Label("Go to ComponentView", systemImage: "car.badge.gearshape.fill")
            }
        }
    }
}

#Preview {
    DashboardView()
}
