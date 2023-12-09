//
//  RentView.swift
//  Scooter
//
//  Created by Fernando Borrell on 12/9/23.
//

import SwiftUI

struct RentView: View {
    var isMoped: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
                .opacity(0.1)
            
            VStack {
                // IMAGE
                if isMoped {
                    Image("moped")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 15)
                } else {
                    Image("electric_scooter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                        .padding(.bottom, 15)
                }
                
                // RENTAL DETAILS
                VStack(alignment: .leading, spacing: 20) {
                    // MODEL DETAILS
                    HStack(spacing: 20.0) {
                        Image(systemName: "scooter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25.0)
                        VStack(alignment: .leading) {
                            Text("Reservation #123-4567890")
                                .font(.caption)
                                .bold()
                            Text("Electric - Prime Scooter")
                                .font(.caption)
                        }
                    }
                    
                    // DATE AND TIMES
                    HStack(spacing: 20.0) {
                        Image(systemName: "calendar.badge.clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25.0)
                        VStack(alignment: .leading) {
                            Text("Date & Times")
                                .font(.caption)
                                .bold()
                            Text("Fri, November 10 @ 3:00 PM\nMon, November 13 @ 8:00 PM")
                                .font(.caption)
                        }
                    }
                }
                
                // SCOOTER BUTTONS
                VStack(alignment: .leading, spacing: 10.0) {
                    
                    HStack(spacing: 10.0) {
                        // Rent
                        Button(action: {
                            print("RENT :)")
                        }) {
                            Label("Rent", systemImage: "creditcard.fill")
                                .font(.custom("Pally-Medium", size: 14.0))
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .buttonBorderShape(.capsule)
                        
                        // Contract
                        Button(action: {
                            print("Contract :)")
                        }) {
                            Label("Contract", systemImage: "signature")
                                .font(.custom("Pally-Medium", size: 14.0))
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    RentView(isMoped: true)
}
