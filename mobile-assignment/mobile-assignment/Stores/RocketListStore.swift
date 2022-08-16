//
//  RocketListStore.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import Foundation


@MainActor final class RocketListStore: ObservableObject {
    enum State {
        case initial
        case loading
        case finished
        case failed
    }

    @Published var state: State = .initial
    @Published var rockets: [Rocket] = .init()
    
    let apiManager = APIManager()

}


extension RocketListStore {
    func load() async {
        state = .loading
        await fetchRockets()
    }
    
    func fetchRockets() async {
        let endpoint = Router.getRockets
        
        do {
            let response: [Rocket] = try await apiManager.request(endpoint)
            rockets += response
            state = .finished
            print("state: \(state)")
            
        } catch {
            Logger.log("\(error)", .error)
            state = .failed
        }
    }
}
