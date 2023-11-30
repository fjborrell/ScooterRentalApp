//
//  BatteryBar.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

struct BatteryBar: View {
    private var fontSize = 12.0
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Battery")
                .font(.system(size: fontSize))
            
            // Bar
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.green)
                .frame(width: 140, height: 28)
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
    BatteryBar()
}
