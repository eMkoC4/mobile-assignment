//
//  RocketParameters.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import SwiftUI

struct RocketParameters: View {
    var rocket: Rocket
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Overview")
                .font(.headline)
            Text(rocket.description)
                .font(.subheadline)
            Text("Parameters")
                .font(.headline)
            HStack(spacing: 16) {
                Group {
                    VStack(spacing: 4) {
                        Text(String(Int(round(rocket.height.meters!))) + "m")
                            .font(.system(size: 24))
                            .bold()
                        Text("height")
                            .font(.headline)
                    }
                    VStack(spacing: 4) {
                        Text(String(rocket.diameter.meters!) + "m")
                            .font(.system(size: 24))
                            .bold()
                        Text("diameter")
                            .font(.headline)
                    }
                    VStack(spacing: 4) {
                        Text(String(rocket.mass.kg) + "t")
                            .font(.system(size: 24))
                            .bold()
                        Text("mass")
                            .font(.headline)
                    }
                }
                .frame(width: 110, height: 110)
               // .aspectRatio(1.0, contentMode: .fit)
                .background(Color("MyPink"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .foregroundColor(Color.white)
        }
    }
}
