//
//  PhotosView.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosView: View {
    var rocket: Rocket
    let columns: [GridItem] = .init(repeating: GridItem(.flexible()), count: 1)
    var body: some View {
        Text("Photos")
            .font(.headline)
        LazyVGrid(columns: columns, spacing: 16 ) {
            ForEach (rocket.flickrImages, id: \.self) { image in
                VStack {
                    WebImage(url: URL(string: image))
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(maxWidth:.infinity, maxHeight: .infinity)
                }
            }
        }
    }
}



