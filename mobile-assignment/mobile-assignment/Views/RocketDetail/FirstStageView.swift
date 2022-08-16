//
//  FirstStageView.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import SwiftUI


struct FirstStageView: View {
    var rocket: Rocket
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("First Stage")
                .font(.headline)
            Group {
                HStack(spacing: 16) {
                    Image("Reusable")
                    if !rocket.firstStage.reusable {
                        Text("Not reusable")
                    } else {
                        Text("reusable")
                    }
                }
                HStack(spacing: 16) {
                    Image("Engine")
                    Text(String(rocket.firstStage.engines) + " engines")
                }
                HStack(spacing: 16) {
                    Image("Fuel")
                    Text(String(rocket.firstStage.fuelAmountTons) + " tons of fuel")
                }
                HStack(spacing: 16) {
                    Image("Burn")
                    if rocket.firstStage.burnTimeSEC != nil {
                        Text(String(rocket.firstStage.burnTimeSEC!) + " seconds burn time")
                    } else {
                        Text("Data not available")
                    }
                }
            }
            .font(.subheadline)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("Gray"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

