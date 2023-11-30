//
//  Tab.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

// Tabs
enum Tab: String, CaseIterable {
    case people = "figure.2.arms.open"
    case devices = "macbook.and.iphone"
    case items = "circle.grid.2x2.fill"
    case me = "person.circle.fill"

    var title: String {
        switch self {
        case .people:
            return "People"
        case .devices:
            return "Devices"
        case .items:
            return "Items"
        case .me:
            return "Me"
        }
    }
}
