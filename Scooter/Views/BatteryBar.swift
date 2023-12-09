//
//  BatteryBar.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

struct BatteryBar: View {
    var fontSize = 12.0
    var barLength: CGFloat
    //var isInvert: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Battery")
                .font(.system(size: fontSize))
            
            // Bar
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.green)
                .frame(width: 250, height: 28)
                .overlay {
                    HStack() {
                        Image(systemName: "battery.100percent.bolt")
                            .font(.system(size: fontSize))
                        Text("82%")
                            .font(.system(size: fontSize))
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                }
        }
    }
}

#Preview {
    BatteryBar(barLength: 170.0)
}
