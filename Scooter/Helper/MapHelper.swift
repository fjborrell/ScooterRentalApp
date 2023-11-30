//
//  MapHelper.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import Foundation
import MapKit

struct PinLocations {
    let rentalLocations = [
        MapLocation(name: "Agora Mall", latitude: 18.48326, longitude: -69.93951),
        MapLocation(name: "Hotel Intercontinental", latitude: 18.46885, longitude: -69.93884),
        MapLocation(name: "Sambil Santo Domingo", latitude: 18.48228, longitude: -69.91197),
        MapLocation(name: "UNIBE", latitude: 18.47501, longitude: -69.90964)
    ]
    
    let scooterLocations = [
        MapLocation(name: "Scooter A", latitude: 18.47201, longitude: -69.92964),
        MapLocation(name: "Scooter B", latitude: 18.47441, longitude: -69.91964)
    ]
}

extension MapLocation: Hashable {
    static func == (lhs: MapLocation, rhs: MapLocation) -> Bool {
        return lhs.name == rhs.name && lhs.coordinate.latitude == rhs.coordinate.latitude && lhs.coordinate.longitude == rhs.coordinate.longitude
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(coordinate.latitude)
        hasher.combine(coordinate.longitude)
    }
}


extension MKCoordinateRegion {
    static var downtownDomRep: MKCoordinateRegion {
        return .init(
            center: .init(latitude: 18.46347, longitude:  -69.92404),
            latitudinalMeters: 4100,
            longitudinalMeters: 4100
        )
    }
}
