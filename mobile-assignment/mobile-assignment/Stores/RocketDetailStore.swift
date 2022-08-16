//
//  RocketDetailStore.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import Foundation

@MainActor final class RocketDetailStore: ObservableObject {
    enum State {
        case initial
        case loading
        case finished
        case failed
    }

    @Published var state: State = .initial
    @Published var rocket: Rocket

    
    private lazy var apiManager = APIManager()
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
    
}


extension RocketDetailStore {
    func load() async {
        state = .loading
        await fetchRocket(with: rocket.id)
    }
}

private extension RocketDetailStore {
    func fetchRocket(with id: Rocket.ID) async {
        let endpoint = Router.getRocketInfo(id: id)
        do {
            //print("response: \(response)")
//            let response: [Detail] = try await apiManager.request(endpoint)
//            print(type(of: response))
//            print("THIS IS THE RESPONSE: \(response)")
            //cat = response.first!.breeds.first!
            rocket = try await apiManager.request(endpoint)
            state = .finished

        } catch {
            Logger.log("\(error)", .error)
            state = .failed
        }

    }
}

