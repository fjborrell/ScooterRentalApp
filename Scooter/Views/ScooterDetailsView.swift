//
//  DetailedRentView.swift
//  Scooter
//
//  Created by Fernando Borrell on 12/9/23.
//

import SwiftUI

struct ScooterDetailsView: View {
    var isMoped: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                // SCOOTER IMAGE
                if isMoped {
                    Image("moped")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170)
                } else {
                    Image("electric_scooter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding()
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    // SCOOTER BUTTONS
                    VStack(alignment: .leading, spacing: 10.0) {
                        BatteryBar(barLength: 250.0)
                        HStack(spacing: 10.0) {
                            // Locate
                            Button(action: {
                                print("Locate :)")
                            }) {
                                Label("Locate", systemImage: "location.circle.fill")
                                    .font(.custom("Pally-Medium", size: 14.0))
                            }
                            .buttonStyle(.borderedProminent)
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
                    .padding(.bottom, 50)
                    
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
                    
                    // LOCATION DETAILS
                    HStack(spacing: 20.0) {
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22.0)
                        VStack(alignment: .leading) {
                            Text("Location")
                                .font(.caption)
                                .bold()
                            Text("Av. John F. Kennedy, 10129")
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
            }
        }
    }
}

#Preview {
    ScooterDetailsView(isMoped: true)
}
