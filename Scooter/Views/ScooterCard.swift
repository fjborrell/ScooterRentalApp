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
    private var width = 315.0
    private var height = 185.0
    private var radius = 20.0
    
    public init(_ color: Color) {
        self.color = color
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .frame(width: width, height: height)
            .shadow(radius: 5)
            .foregroundStyle(color)
            .overlay {
                Image("scooters")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 2.2)
                    .opacity(0.22)
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
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
                    .shadow(radius: 2)
            }
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    BatteryBar(barLength: 50)
                    IDBar()
                }
                .padding(cornerPadding)
            }
    }
}

#Preview {
    ScooterCard(Color.cyan)
}
