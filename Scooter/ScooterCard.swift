//
//  ScooterCard.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

struct ScooterCard: View {
    public var color: Color = Color.cyan
    private var cornerPadding = 20.0
    
    public init(_ color: Color) {
        self.color = color
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 275, height: 180)
            .foregroundStyle(color)
            .overlay {
                Image("scooters")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 1.8)
                    .opacity(0.3)
                    .frame(width: 275, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            }
            .overlay(alignment: .topLeading) {
                Text("Scooter ABC")
                    .padding(cornerPadding)
                    .font(.title3.bold())
            }
            .overlay(alignment: .topTrailing) {
                Image(systemName: "creditcard.circle.fill")
                    .padding(cornerPadding - 6)
                    .font(.system(size: 40))
            }
            .overlay(alignment: .bottomTrailing) {
                Image("scooter-logo-sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45)
                    .padding(cornerPadding - 4)
            }
            .overlay(alignment: .bottomLeading) {
                VStack {
                    BatteryBar()
                    IDBar()
                }
                .padding(cornerPadding)
            }
    }
}

#Preview {
    ScooterCard(Color.cyan)
}
