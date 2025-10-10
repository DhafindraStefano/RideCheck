//
//  GarageView.swift
//  RideCheck
//
//  Created by Dhafindra Razaqa Stefano on 10/10/25.
//

import SwiftUI

struct GarageView: View {
    var body: some View {
        NavigationStack{
            Text("This is where GarageView will go")
            NavigationLink{ VehicleDetailsView()
            } label: {
                Text("Go to Vehicle Details")
            }
        }
    }
}

#Preview {
    GarageView()
}
