//
//  Endpoint.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import Foundation


protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var urlParamaters: [String: Any]? { get }
    var headers: [String: String]? { get }

    func asRequest() throws -> URLRequest
}

extension Endpoint {
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        nil
    }
    
    func asRequest() throws -> URLRequest {
        let baseUrl = URL(string: "https://api.spacexdata.com/v3/")!
        let urlPath = baseUrl.appendingPathComponent(path)
        guard var urlComponents = URLComponents(url: urlPath, resolvingAgainstBaseURL: true) else {
            throw APIError.invalidURLComponents
        }
        
        if let urlParameters = urlParamaters {
            urlComponents.queryItems = urlParameters.map({ key, value in
                URLQueryItem(name: key, value: String(describing: value))
            })
        }
        
        guard let url = urlComponents.url else {
            throw APIError.invalidURLComponents
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.setValue(HTTPHeader.ContentType.json.rawValue, forHTTPHeaderField: HTTPHeader.HeaderField.contentType.rawValue)
        return urlRequest
    }
}
