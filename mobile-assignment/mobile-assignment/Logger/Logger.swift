//
//  Logger.swift
//  mobile-assignment
//
//  Created by IvanQ on 19.06.2022.
//

import os.log

final class Logger {
    enum MessageKind {
        case info
        case success
        case error
    }
    
    private init() {}
}

extension Logger {
    static func log(_ message: String, _ kind: MessageKind = .info, _ type: OSLogType = .info) {
        let icon: String
        
        switch kind {
        case .info:
            icon = "ℹ️"
        case .success:
            icon = "✅"
        case .error:
            icon = "🔴"
        }
        
        os_log("%@ %@", type: type, icon, message)
    }
}
