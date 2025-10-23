//
//  TestAdrianXD.swift
//  RideCheck
//
//  Created by Adrian Yusufa Rachman on 23/10/25.
//



import Foundation
import SwiftUI


// ====== EXAMPLE USAGE =======
struct OilMeterView: View {
    // add ur durability thingy here
    @State private var oilLevel: CGFloat = 1
    @State private var TireLevel: CGFloat = 1

    var body: some View {
        VStack(spacing: 30) {
            
            //-------- COPY HERE --------
            ComponentIconView(
                Durability: oilLevel,
                IconSize: 100,
                systemIconName: "oilcan.fill",
                fillableRatio: 1.0 / 2.3 // sf symbol could get wonky. Adjust accordingly
            )
            // -------- TO HERE ----------
        
            // optional slider here, change it something else later yea?
            Slider(value: $oilLevel, in: 0...1.0)
                .padding(.horizontal)
            
            Text("Oil Level: \(Int(oilLevel * 100))%")
                .font(.title2)
            
            // another ex(ample)
            ComponentIconView(
                Durability: TireLevel,
                IconSize: 100,
                systemIconName: "tire",
                fillableRatio: 1.0
            )
            
            Slider(value: $TireLevel, in: 0...1.0)
                .padding(.horizontal)
            
            Text("Tire Level: \(Int(TireLevel * 100))%")
                .font(.title2)
        }
        .padding()
    }
}
// easy no?


// ======== the very smart logic BY ADRIAN RACHMAN (Adrian made this) ==========
// Adrian made this btw
struct ComponentIconView: View {

    let Durability: CGFloat
    let IconSize: CGFloat
    let systemIconName: String
    let fillableRatio: CGFloat
    let emptyColor = Color.gray.opacity(0.3)
    
    // calculate color based on durability
    var currentColor: Color {
        // 100% - 60% is green
        if Durability >= 0.60 {
            return Color(hex: "#35DE26")
        // 59% - 21% is yellow
        } else if Durability >= 0.21 {
            return Color(hex: "#FFC700")
        // 20% - 0% is red
        } else {
            return Color(hex: "#EF4444")
        }
    }

    init(
        Durability: CGFloat,
        IconSize: CGFloat,
        systemIconName: String,
        fillableRatio: CGFloat = 1.0 // Default to 1.0
    ) {
        self.Durability = Durability
        self.IconSize = IconSize
        self.systemIconName = systemIconName
        self.fillableRatio = fillableRatio
    }

    var body: some View {

        GeometryReader { geometry in
            ZStack {
                // 1. The Background Layer (Empty)
                Image(systemName: systemIconName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(emptyColor)

                // 2. The Foreground Layer (Filled)
                Image(systemName: systemIconName)
                    .resizable()
                    .scaledToFit()
                    // UPDATED: Use the new computed property
                    .foregroundColor(currentColor)
                    
                    // 3. The Mask
                    .mask(alignment: .bottom) {
                        Rectangle()
                            .frame(height: (geometry.size.height * fillableRatio) * Durability)
                    }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .frame(width: IconSize, height: IconSize)
    }
}

#Preview {
    OilMeterView()
}
