//
//  URL.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import Foundation

extension URL {
    func valueOf(queryParameter: String) -> String? {
        guard let url = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        return url.queryItems?
            .first { $0.name == queryParameter }?
            .value
    }
}
