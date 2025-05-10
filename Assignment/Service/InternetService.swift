//
//  InternetService.swift
//  Assignment
//
//  Created by Ravneet Singh on 10/05/25.
//

import Foundation
import Network

final class InternetService {
    private init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
    
    static let shared: InternetService = InternetService()
    private let monitor: NWPathMonitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    var isConnected: Bool = true
}
