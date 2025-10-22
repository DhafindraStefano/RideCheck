//
//  Color+Extension.swift
//  RideCheck
//
//  Created by Adrian Yusufa Rachman on 22/10/25.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        // 1. Trim whitespace and newlines, and remove the "#" prefix if it exists
        let hex = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        var int: UInt64 = 0
        
        // 2. Scan the hex string into an integer
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        
        // 3. Extract the RGBA components based on the string length
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Default to black
        }
        
        // 4. Initialize the Color
        self.init(
            .sRGB,
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0,
            opacity: Double(a) / 255.0
        )
    }
}
