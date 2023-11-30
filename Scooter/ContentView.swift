//
//  ContentView.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/18/23.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @Environment(WindowSharedModel.self) private var windowSharedModel
    @Environment(SceneDelegate.self) private var sceneDelegate
    
    let rentals = PinLocations().rentalLocations
    let scooters = PinLocations().scooterLocations
    
    var filteredRentals: [MapLocation] {
        guard !searchText.isEmpty else { return rentals }
        return rentals.filter { rental in
            rental.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var filteredScooters: [MapLocation] {
        guard !searchText.isEmpty else { return scooters }
        return scooters.filter { scooter in
            scooter.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var locationManager = CLLocationManager()
    @State var searchText = String()
    @State var selectedTag: UUID?
    
    var body: some View {
        @Bindable var bindableObject = windowSharedModel
        
        TabView(selection: $bindableObject.activeTab) {
            NavigationStack {

                Map(initialPosition: .region(.downtownDomRep), selection: $selectedTag) {
                    /// User Dot
                    UserAnnotation()
                    
                    /// Rental Locations
                    ForEach(filteredRentals, id: \.self) { rental in
                        Marker(rental.name, coordinate: rental.coordinate)
                            .tag(rental.id)
                    }
                    
                    /// Scooter Locations
                    ForEach(filteredScooters, id: \.self) { scooter in
                        Marker(scooter.name, systemImage: "scooter", coordinate: scooter.coordinate)
                            .tint(.blue)
                            .tag(scooter.id)
                    }
                }
                .onChange(of: selectedTag) {
                    print(selectedTag ?? "Nothing")
                }
                .mapStyle(.standard(elevation: .realistic, emphasis: .muted))
                .mapControls {
                    MapUserLocationButton()
                    MapCompass()
                        .mapControlVisibility(.visible)
                    MapScaleView()
                        .mapControlVisibility(.visible)
                }
                
            }
            .searchable(text: $searchText)
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
            
            locationManagerDidChangeAuthorization(locationManager)
        }
    }
}

func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    switch manager.authorizationStatus {
    case .authorizedWhenInUse:  // Location services are available.
        print("Located :)")
        break
        
    case .restricted, .denied:  // Location services currently unavailable.
        print("Not Located :(")
        break
        
    case .notDetermined:        // Authorization not determined yet.
        manager.requestWhenInUseAuthorization()
        break
        
    default:
        break
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
