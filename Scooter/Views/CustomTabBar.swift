//
//  CustomTabBar.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/29/23.
//

import SwiftUI

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

#Preview {
    CustomTabBar()
}
