//
//  ContentView.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/18/23.
//

import SwiftUI
import MapKit

// Apple Park Location Coordinates
extension MKCoordinateRegion {
    static var applePark: MKCoordinateRegion {
        return .init(
            center: .init(latitude: 37.3346, longitude: -122.0090),
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
    }
}


struct ContentView: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel
    var body: some View {
        @Bindable var bindableObject = windowSharedModel
        TabView(selection: $bindableObject.activeTab) {
            NavigationStack {
                Text("People")
            }
            .tag(Tab.people)
            .hideNativeTabBar()
            
            NavigationStack {
                Text("Devices")
            }
            .tag(Tab.items)
            .hideNativeTabBar()
            
            NavigationStack {
                Text("Items")
            }
            .tag(Tab.items)
            .hideNativeTabBar()
            
            NavigationStack {
                Text("Me")
            }
            .tag(Tab.me)
            .hideNativeTabBar()
        }
        .tabSheet(initialHeight: 100, sheetCornerRadius: 15) {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 15) {
                        
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                }
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(windowSharedModel.activeTab.title)
                            .font(.title3.bold())
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
