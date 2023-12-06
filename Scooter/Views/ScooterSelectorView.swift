//
//  ScooterSelectorView.swift
//  Scooter
//
//  Created by Fernando Borrell on 12/5/23.
//

import SwiftUI

struct ScooterSelectorView: View {
    private var cornerPadding = 20.0
    private var width = 140.0
    private var height = 100.0
    private var radius = 20.0
    
    var moped: some View {
        VStack(spacing: 5.0) {
            Text("Moped")
                .font(.custom("Pally-Regular", size: 15))
                .foregroundStyle(.black)
                .padding(.bottom, 28)
            Image("vespa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110.0, height: 70.0)
        }
        .frame(height: 120.0)
    }
    
    var scooter: some View {
        VStack(spacing: 5.0) {
            Text("Scooter")
                .font(.custom("Pally-Regular", size: 15))
                .foregroundStyle(.black)
                .padding(.bottom, 16)
            Image("scootericon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130.0, height: 90.0)
                .offset(y: -10)
        }
        .frame(height: 120.0)
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 25.0) {
            buttonCreator(icon: moped)
            buttonCreator(icon: scooter)
        }
    }
    
    @ViewBuilder
    func buttonCreator(icon: some View) -> some View {
        Button(action: {
            print("Button Clicked!")
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.linearGradient(colors: [.white, .cyan], startPoint: .topLeading, endPoint: .bottom))
                    .shadow(radius: 5)
                    .frame(width: 150.0, height: 150.0)
                icon
            }
        }
        
    }
}

#Preview {
    ScooterSelectorView()
}
