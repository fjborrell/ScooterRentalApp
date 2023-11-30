//
//  Tab.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

// Tabs
enum Tab: String, CaseIterable {
    case map = "map"
    case profile = "person"

    var title: String {
        switch self {
        case .map:
            return "Map"
        case .profile:
            return "Profile"
        }
    }
}
