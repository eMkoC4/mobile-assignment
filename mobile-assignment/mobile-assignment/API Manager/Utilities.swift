//
//  Utilities.swift
//  mobile-assignment
//
//  Created by IvanQ on 16.08.2022.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum HTTPHeader {
    // key
    enum HeaderField: String {
        case contentType = "Content-Type"
    }

    // value
    enum ContentType: String {
        case json = "application/json"
    }
}

enum APIError: Error, LocalizedError {
    case invalidURLComponents
    case noResponse
    case unacceptableResponseStatusCode
    case customDecodingFailed
}

