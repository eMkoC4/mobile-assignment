//
//  RocketListView.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import SwiftUI

struct RocketListView: View {
    let rocket: Rocket
    var body: some View {
        HStack(spacing: 16) {
            Image("Rocket")
            VStack(alignment: .leading, spacing: 2) {
                Text(rocket.rocketName)
                    .font(.headline)
                Text("First flight: \(rocket.firstFlight)")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
        }
    }
}
