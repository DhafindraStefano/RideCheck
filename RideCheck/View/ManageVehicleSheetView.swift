//
//
//  ManageVehicleSheetView.swift
//  RideCheck
//  Created by ye boi Adrian

import Foundation
import SwiftUI


struct Vehicle: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var symbolName: String
}

struct ManageVehicleSheetView: View {

    @Environment(\.dismiss) var dismiss

    @State private var vehicles: [Vehicle] = [
        Vehicle(name: "Aerox 6969", type: "Motorcycle", symbolName: "motorcycle.fill"),
        Vehicle(name: "CBR N1", type: "Motorcycle", symbolName: "motorcycle.fill")
    ]

    @State private var selectedVehicleID: UUID?

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.body.weight(.bold))
                        .foregroundColor(.secondary)
                        .padding(10)
                        .background(Color(.systemGray6), in: Circle())
                }
                Spacer()
            }
            .overlay(
                Text("Manage Vehicle")
                    .font(.headline)
                    .fontWeight(.semibold)
            )
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 20)

            // --- Vehicle List ---
            VStack {

                ForEach(vehicles) { vehicle in
                    VehicleItemView(
                        symbolName: vehicle.symbolName,
                        vehicleName: vehicle.name,
                        vehicleType: vehicle.type,

                        isSelected: selectedVehicleID == vehicle.id
                    )
                    .onTapGesture {
                        selectedVehicleID = vehicle.id
                    }
                }

                AddNewVehicleButton()
            }

            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .padding(.horizontal)

            Spacer()
        }
        .onAppear {

            if let firstVehicle = vehicles.first {
                selectedVehicleID = firstVehicle.id
            }
        }
    }
}

struct VehicleItemView: View {
    var symbolName: String
    var vehicleName: String
    var vehicleType: String
    var isSelected: Bool

    var body: some View {
     
        let circleBackgroundColor = isSelected ? Color(hex: "#D5EFFF") : Color(hex: "#E8E8EC")
        let symbolColor = isSelected ? Color(hex: "#008BFF") : Color(hex: "#8E8E92")
        let backgroundColor = isSelected ? Color(hex: "#F2F9FF") : Color(hex: "#EDEDF2")
        let overlayColor = isSelected ? Color(hex: "#A7DDFF") : Color(hex: "#F2F2F6")

        HStack {
            // --- Icon ---
            ZStack {
                Circle()
                    .fill(circleBackgroundColor)
                    .frame(width: 45, height: 45)

                Image(systemName: symbolName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(symbolColor)
            }

            // --- Vehicle Info ---
            VStack(alignment: .leading) {
                HStack(spacing: 8) {
                    Text(vehicleName)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)

                  
                   
                    if isSelected {
                        Text("Current")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(hex: "#008BFF"))
                            .clipShape(Capsule())
                    }
                }

                Text(vehicleType)
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundStyle(Color(hex: "85878F"))
            }

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 79)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(overlayColor, lineWidth: 1)         )
        .animation(.easeIn(duration: 0.1555), value: isSelected)
    }
}

struct AddNewVehicleButton: View {
    var body: some View {
        HStack {
            
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 20)) 
                .foregroundStyle(Color(hex: "#00CA48"))
              
            VStack(alignment: .leading){
                
                Text("Add New Vehicle")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(hex: "#00CA48"))
                Text("Create another vehicle")
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundStyle(Color(hex: "85878F"))
                
            }
            .padding()
                
            Spacer()
            Image(systemName: "chevron.forward")
                .font(.system(size: 20))
                .foregroundStyle(Color(hex: "#8E8E92"))
              

        
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 79)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "#F3FCF7"))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(hex: "#B2EFC9"))         )
    }
}

#Preview {
    ManageVehicleSheetView()
}


//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⣿⣿⣿⡿⠋⣠⣶⣿⣿⣿⣷⣄⠙⢿⣿⣿⣿⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠈⠿⡿⠁⣀⣄⡉⠻⣿⣿⠟⠉⢀⣉⠻⠟⠁⠀⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⡄⠀⠀⢀⠀⣀⠀⢀⡃⠀⠀⢀⠀⠱⢠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢠⣶⣤⡤⠤⢶⣿⣿⣦⣤⣄⣤⣮⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠘⠛⠋⣀⣀⠈⠛⢛⣋⣩⣌⠻⠿⠆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠿⠠⣄⡙⠿⢿⣿⣿⣿⣿⠿⢷⣄⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⢀⣶⢸⣿⣿⣤⣤⣤⣴⣶⣶⣿⣿⣿⣆⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⢠⣿⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣼⣿⣷⣮⣕⣈⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠙⠃⣤⡙⠛⠻⢿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣮⣟⢿⣿⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⡿⠟⣋⣍⣩⣤⣄⠀⢀⣤⣶⣶⣄⣈⠙⠂⣀⣀⣭⣥⣴⣶⣾⢡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡙⣿⣿⣿⣿
//⣿⣿⣿⣿⣿⡿⠁⣤⣾⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣭⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡜⣿⣿⣿
//⣿⣿⣿⣿⠏⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢸⣿⣿
//⣿⣿⣿⠏⠀⠾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠘⢻⣿⣿⣿⣿⣿⣿⡌⢿⣿
//⣿⣿⣿⠀⢁⡀⠿⡿⠿⠙⠁⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⠔⠀⢀⣣⣄⣉⣿⣿⣿⣿⣿⡌⣿
//⣿⣿⡿⠀⠘⢁⠀⠀⠀⠀⠀⢈⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⡿⢋⡀⠀⠘⣿⢿⣿⡿⠿⠿⡭⠛⠉⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸
//⣿⣿⢁⣾⣦⠀⢷⣶⣦⠀⠀⠈⠓⢤⡀⠉⠉⠋⠉⠉⠉⠛⠛⣛⣁⠀⠀⠀⢀⣀⠀⣀⡀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸
//⣿⠇⣼⣿⣿⡇⣼⣿⣿⡇⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⣠⢶⣿⣿⣿⣷⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸
//⣿⠀⣿⣿⡿⢰⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣶⣾⣿⣿⣿⣿⣿⣶⣟⣀⣠⣄⣠⣴⣶⡀⠀⠙⢿⡏⢿⣿⣿⣿⣿⣿⣿⣾
//⡿⠀⢹⡿⢁⣿⣿⣿⣿⠁⣰⡀⠀⠀⠀⠐⠦⡈⢻⣿⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠀⠄⡀⠈⠿⠈⠻⣿⣿⣿⣿⡇⣿
//⡇⣼⣟⠃⣼⣿⣿⠟⠁⢠⣿⣷⡀⠀⢀⣀⠀⠀⢀⣀⣀⣀⣈⠻⣷⣀⣤⣄⣉⡉⠻⠿⠿⢟⣷⡤⢀⣼⣷⡀⠀⠀⢀⣿⣿⣿⣿⣿⢿
//⣠⣿⣿⡄⠉⠉⠁⠀⢠⣾⣿⣿⡇⠀⡺⣿⣷⠀⢸⣿⣿⣿⣿⣿⠈⣽⣿⣿⣿⣿⣯⣴⣶⣶⣿⡇⣾⣿⣿⣿⡄⠀⣤⣿⣿⣿⣿⡿⣸
//⣿⣿⣿⣿⣆⠀⠀⣴⣿⣿⣿⣿⡇⠘⣿⣏⢿⡇⠈⠛⠛⢻⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢹⣿⣿⣿⣿⢁⣿⣿⣿⣿⣿⣿⡃⢸
//⣿⣿⣿⣿⣿⣦⡄⣻⣿⣿⣿⣿⠀⣶⣿⣿⣷⣬⡐⢶⣶⣶⡎⠉⣰⣦⣤⣥⣾⣿⣿⣿⣿⣿⠃⣸⣿⣿⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⢸
//⣿⣿⣿⣿⣿⣿⣄⣻⣿⣿⣿⡿⠀⣿⡟⢻⣿⣿⣿⠾⣾⢿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⡿⠯⢠⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⡟⢸

//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⠤⠤⢤⣄⡀⠀⠀⢰⠿⢧⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠋⠁⠀⠀⠀⢀⣬⠽⠳⣤⢞⡴⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⢀⡀⠀⠠⠉⣠⣤⡄⠀⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⢀⣶⣤⡀⠀⢠⡷⠋⣁⣀⢰⡀⠀⠘⠓⠊⠁⠀⠀⠘⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠸⣧⣇⡩⣟⡛⠀⠸⠯⠍⡻⠛⠉⠉⢉⣽⠠⠤⠤⡀⠘⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⢸⠀⠀⠈⠀⢧⠤⠤⠖⢡⠀⠀⠀⣠⠄⠀⠸⣷⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⢀⠎⠀⠀⠘⠀⢀⣠⡴⠚⡙⠀⠀⠀⠇⠉⠻⣯⠙⠲⠶⠛⣆⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣿⡀⠸⠄⠶⣖⠒⠚⢉⣠⣴⡞⠁⠀⠀⠀⡆⠀⠀⣿⡇⠀⠰⡀⢹⠉⠛⠶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⣔⢠⡿⢳⣄⠀⠀⠈⠉⠙⠛⠋⠁⠀⠀⠀⠀⡼⠀⠀⣼⡟⠀⢀⠀⣧⠸⡇⠀⠀⠈⠙⢶⣄⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⣰⠞⡿⣸⣿⠻⣷⠀⠙⠷⣄⡀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠁⣠⣾⢏⢰⡿⢷⣅⢸⢠⡇⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⢀⡾⠁⢰⡇⡇⠀⣆⠻⣦⣀⠀⠈⠙⠓⠶⠤⠤⠤⠶⠚⣁⣴⣺⠿⠋⠀⡎⢄⣰⡿⠈⣾⡇⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀
//⠀⠀⠀⢀⡾⠀⠀⢸⡇⠃⣖⣱⡦⠙⠪⣓⡢⠤⠄⣀⣤⡤⠴⢒⡭⠗⠋⠁⠀⠀⠀⠀⠈⠀⠀⠀⢿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣄⠀⠀
//⠀⠀⢠⡟⠀⠀⠀⠀⢻⡔⠙⡿⠟⠂⠀⠈⣉⣓⣦⣠⣤⣤⠶⡷⠶⠶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠙⣆⠀
//⠀⢠⠏⠀⠀⠀⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠉⢹⠳⠟⠙⠷⠀⢹⡄⣤⡤⠀⣶⣴⣤⠀⠀⠀⢴⣤⣤⠹⣶⣤⡀⢀⠞⣠⠄⠀⠀⠀⠀⢸⡆
//⢠⡏⠀⠀⠐⢄⡀⠀⠀⡇⠀⣴⣤⠀⠀⠛⢁⡟⠀⠀⠀⠀⠀⠀⠻⣤⣤⣤⣤⣤⣭⣤⣤⣄⣀⣀⣛⡀⠘⡇⣻⠋⠞⠀⠀⠀⠀⠀⠀⢸⠃
//⣾⠁⠀⠀⠀⠀⢭⡂⣸⡇⣀⡭⠿⠶⠖⠒⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢻⠃⡿⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀
//⣿⠀⠀⠀⠀⠀⠠⠭⢹⡙⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣷⡇⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀
//⢹⡄⠀⠀⠀⠀⠀⠀⠀⢳⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠁⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀
//⠀⢳⡄⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡿⠶⣤⣀⡀⡀⠀⠀⣸⠁⠀⠀
//⠀⠀⠹⣄⠀⠀⠀⠀⠀⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠃⠀⠀⠈⠉⠙⠓⢳⡟⠀⠀⠀
//⠀⠀⠀⠈⢦⡀⠀⢀⡴⠋⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⣷⠀⠀⠀
//⠀⠀⠀⠀⠀⠙⠶⡟⠁⠀⣼⢷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⠟⠉⠈⣧⣀⡤⡀⢀⠀⢀⣀⡿⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠙⢦⣀⡿⠀⠙⢿⣷⣦⣤⣤⣀⣀⣀⣀⣀⣀⣀⣀⣤⣤⣶⣾⣿⣿⡿⠟⠋⠀⠀⠀⠀⣿⠛⠒⠚⠉⠉⠉⠉⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠈⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣷⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣴⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠈⠙⠓⠦⢤⣤⣀⠀⢀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⠶⠞⠛⠉⠁⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⢀⡇⠀⠀⠀⣾⠉⠙⠛⠛⠛⠒⠚⠛⠛⠛⢿⠉⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⢿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⣄⠀⠀⢀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠈⠢⠀⠘⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀⠀⠀⠀⠀⢀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣶⣇⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⡀⠀⠀⠀⢸⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢿⡿⣷⣶⣶⣿⣽⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⡧⢤⣶⣶⣾⣿⡛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⢀⣀⣴⠞⠁⠀⠁⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⠋⣿⠹⠏⠈⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⢀⡶⠋⠉⠀⠀⠀⠀⠀⠀⢀⣀⣀⣸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠁⠀⠀⠀⠈⢳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠈⠙⠓⠶⠶⠶⠶⠶⠚⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣇⡀⠀⠀⠀⠀⠀⠀⣀⣽⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
//⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠶⠶⠶⠶⠟⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⣛⣛⣛⣛⡻⠿⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢁⣺⣿⣿⣿⣿⣿⣿⣿⣶⠈⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠃⠼⢽⣿⣿⠿⠻⠛⠻⢿⣿⠀⣾
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠙⠁⠀⠀⢠⡀⠀⢬⠃⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠻⡄⠀⣇⠀⠃⠀⠘⡇⠀⠄⢿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⢈⢸⡿⣦⣀⢀⣀⣴⣿⡆⢸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠙⠳⠞⠁⠸⠷⠦⠈⠉⠉⠉⠀⠀⢸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠆⠀⠀⠤⠿⠂⠀⠀⠀⠀⢸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡄⠀⠀⠀⠈⣠⡼⠃⠀⠀⠀⢸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠛⠉⠀⢀⠠⠀⠀⢸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠠⠀⠀⠀⠀⢤⠘⠤⠁⢰⡆⢸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢠⠋⠤⡉⠐⡀⠀⢿⠸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠄⠀⠀⡘⢀⠆⠡⠀⠀⣈⠀
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⡐⠈⠤⢁⠂⠀⡟⢰
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡀⠀⠀⠀⠠⠁⠂⠄⠀⣸⠁⣸
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠁⠀⠀⠀⠀⠀⠀⠀⠈⠁⢰⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢁⠆⠀⠀⠀⢀⣐⠀⠀⠀⢀⣸⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡁⠁⣼⡇⠀⠀⣿⣿⠀⡀⢀⣷⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⡔⠀⣼⣿⡇⣀⠀⣿⣿⡆⣡⠘⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⣿⡿⢡⡞⢀⣾⣿⣿⣇⠀⠀⢿⣿⡇⠁⠀⣿⣿⣿
//⣿⣿⣿⣿⣿⣿⡏⣴⡇⢠⣾⣿⣿⣿⣿⠀⠀⢸⣿⣧⠀⠀⣿⣿⣿
//⣿⣿⣿⣿⣿⠏⣼⠍⢀⣿⣿⣿⣿⣿⣿⡀⠀⢸⣿⣿⡀⠀⣻⣿⣿
//⣿⣿⣿⡿⠋⡸⠁⢀⣾⣿⣿⣿⣿⣿⣿⣇⢀⠈⣿⣿⡇⠀⢸⣿⣿
//⣿⣿⠟⠁⠄⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⢿⡿⠁⠀⠘⣿⣿
//⡿⠋⠀⠀⠀⣠⣾⣿⣿⣿⠿⠛⣛⣹⡏⠀⠀⠀⠀⢠⣾⣆⠀⢻⣿
//⣦⣀⡀⠀⢰⣿⣿⣿⡃⠄⠤⡶⠋⠉⣁⣠⣴⡆⠰⠛⠻⠻⠢⠘⣿
//⣿⣿⣿⣷⣿⣿⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⣯⣁⣀⡊⣘⣀⣀⣤⣿
