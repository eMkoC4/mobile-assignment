//
//  RocketDetailView.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import SwiftUI

struct RocketDetailView: View {
    @StateObject var store: RocketDetailStore
    @State private var isShowingRocketPage = false
    
    var body: some View {
        Group {
            switch store.state {
            case .finished:
                makeContent(rocket: store.rocket)
            case .initial, .loading:
                ProgressView()
            case .failed:
                Text("🥲🥲🥲 Something went wrong")
            }
        }
        .onAppear(perform: load)
        .navigationTitle(store.rocket.rocketName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension RocketDetailView {
    func makeContent(rocket: Rocket) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                RocketParameters(rocket: rocket)
                FirstStageView(rocket: rocket)
                SecondStageView(rocket: rocket)
                PhotosView(rocket: rocket)
                
            }
            .padding(16)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination:
                                    AnimatedFlightView()
                    ) {
                        Text("Launch")
                            .bold()
                    }

                }
            }
        }
    }
}


extension RocketDetailView {
    func load() {
        Task {
            await store.load()
        }
    }
}
