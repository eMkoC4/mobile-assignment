//
//  Router.swift
//  mobile-assignment
//
//  Created by IvanQ on 16.08.2022.
//

import Foundation

enum Router {
    case getRockets
    case getRocketInfo(id: Rocket.ID)
}

extension Router: Endpoint {
    
    //https://api.spacexdata.com/v3/rockets
    //https://api.spacexdata.com/v3/rockets/{{rocket_id}}
    

    var path: String {
        switch self {
        case .getRockets:
            return "rockets"
        case .getRocketInfo(let id):
            return "rockets/\(id)"
        }
    }
    
    var urlParamaters: [String : Any]? {
        switch self {
        case .getRockets:
            return nil
        case let .getRocketInfo(id):
            return [id: id]
        }
    }
    
}
