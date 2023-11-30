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
            center: .init(latitude: 18.4739, longitude: -69.9100),
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
    }
}


struct ContentView: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel
    @Environment(SceneDelegate.self) private var sceneDelegate
    var body: some View {
        @Bindable var bindableObject = windowSharedModel
        TabView(selection: $bindableObject.activeTab) {
            NavigationStack {
                Map(initialPosition: .region(.applePark))
            }
            .tag(Tab.map)
            .hideNativeTabBar()
            
            NavigationStack {
                Text("Profile")
            }
            .tag(Tab.profile)
            .hideNativeTabBar()
        }
        .tabSheet(initialHeight: 110, sheetCornerRadius: 15) {
            NavigationStack {
                ScrollView {
                    if windowSharedModel.activeTab == .map {
                        cardBuilder([Color.mint, Color.blue, Color.cyan, Color.green])
                    }
                }
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        if windowSharedModel.activeTab == .map {
                            Text("My Scooters")
                                .font(.title3.bold())
                        } else {
                            Text(windowSharedModel.activeTab.title)
                                .font(.title3.bold())
                        }
                    }
                }
            }
        }
        .onAppear {
            guard sceneDelegate.tabWindow == nil else { return }
            sceneDelegate.addTabBar(windowSharedModel: windowSharedModel)
        }
    }
}


// CUSTOM TAB
struct CustomTabBar: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button {
                        windowSharedModel.activeTab = tab
                    } label: {
                        VStack {
                            Image(systemName: tab.rawValue)
                                .font(.title2)
                            Text(tab.title)
                                .font(.caption)
                        }
                        .foregroundStyle(windowSharedModel.activeTab == tab ? Color.accentColor : .gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                    }
                }
            }
            .frame(height: 55)
        }
        .background(.regularMaterial)
    }
}


@ViewBuilder
func cardBuilder(_ colors: [Color]) -> some View {
    VStack(spacing: 15) {
        ForEach(colors.indices, id: \.self) { index in
            ScooterCard(colors[index])
        }
    }
    .padding(.horizontal, 15)
    .padding(.vertical, 10)
}

#Preview {
    ContentView()
}
