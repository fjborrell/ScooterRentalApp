//
//  IDBar.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

struct IDBar: View {
    private var fontSize = 12.0
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Identification")
                .font(.system(size: fontSize))
            
            // Bar
            RoundedRectangle(cornerRadius: 50)
                .foregroundStyle(.gray)
                .frame(width: 140, height: 28)
                .overlay {
                    HStack() {
                        Image(systemName: "number.circle")
                            .font(.system(size: fontSize))
                        Text("123-456789")
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
    IDBar()
}
