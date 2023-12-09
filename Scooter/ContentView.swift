//
//  ContentView.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/18/23.
//

import SwiftUI
import MapKit


struct ContentView: View {
    // Window-Related Variables
    @Environment(WindowSharedModel.self) private var windowSharedModel
    @Environment(SceneDelegate.self) private var sceneDelegate
    
    // Map Related Variables
    @State var searchText = String()
    @State var selectedTag: UUID?
    let rentals = PinLocations().rentalLocations
    let scooters = PinLocations().scooterLocations
    var locationManager = CLLocationManager()
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
    
    func getRentalName(rentalId: UUID?) -> String? {
        guard rentalId == rentalId else {
            return nil
        }
        
        for rental in filteredRentals {
            if rental.id == rentalId {
                return rental.name
            }
        }
        return nil
    }
    
    @ViewBuilder
    func mapSheetView() -> some View {
        let rentalName: String = getRentalName(rentalId: selectedTag) ?? "Unknown"
        
        if selectedTag != nil {
            
            if rentalName == "Unknown" {
                ScooterDetailsView(isMoped: false)
            } else {
                VStack {
                    Text("Rent a ride from:")
                        .font(.custom("Pally-Regular", size: 20))
                        .padding(.top, 10)
                    Text("\(rentalName)")
                        .font(.custom("Pally-Medium", size: 20))
                        .padding(.bottom, 25)
                    
                    ScooterSelectorView()
                }
            }
            
        } else {
            cardBuilder([Color.indigo, Color.blue, Color.purple, Color.green])
        }
    }
    
    
    var body: some View {
        @Bindable var bindableObject = windowSharedModel
        
        TabView(selection: $bindableObject.activeTab) {
            // MAP VIEW
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
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("scooter-logo-sun")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75, alignment: .center)
                            //.padding(.horizontal, UIScreen.main.bounds.width / 2)
                    }
                }
                
            }
            .tag(Tab.map)
            .hideNativeTabBar()
            
            // PROFILE VIEW
            NavigationStack {
                VStack(spacing: 70.0) {
                    CustomQRCode()
                }
            }
            .tag(Tab.profile)
            .hideNativeTabBar()
        }
        .tabSheet(initialHeight: 110, sheetCornerRadius: 15) {
            NavigationStack {
                ScrollView {
                    if windowSharedModel.activeTab == .map {
                        mapSheetView()
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
