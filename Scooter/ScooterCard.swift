//
//  ScooterCard.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

struct ScooterCard: View {
    private var cornerPadding = 20.0
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 275, height: 180)
            .foregroundStyle(.cyan)
            .overlay(alignment: .topTrailing) {
                Text("Scooter ABC")
                    .padding(cornerPadding)
                    .font(.title3.bold())
            }
            .overlay(alignment: .topLeading) {
                Image(systemName: "creditcard.circle.fill")
                    .padding(cornerPadding - 6)
                    .font(.system(size: 40))
            }
            .overlay(alignment: .bottomTrailing) {
                Image("scooter-logo-sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .padding(cornerPadding)
            }
    }
}

#Preview {
    ScooterCard()
}
