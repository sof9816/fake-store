//
//  NetworkStatus.swift
//  FakeStore
//
//  Created by Mustafa Naser on 27/04/2024.
//
import Network
import SwiftUI

/// An enum to represent network status.
enum NetworkStatus: String {
    case connected
    case disconnected
}

/// A class to monitor network status changes.
class NetworkMonitor: ObservableObject {
    /// The network path monitor.
    private let monitor = NWPathMonitor()
    
    /// The dispatch queue for the monitor.
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")

    /// The current network status.
    @Published var status: NetworkStatus = .connected

    /// Initializes the network monitor.
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            // Monitor runs on a background thread so we need to publish
            // on the main thread
            DispatchQueue.main.async {
                self.updateNetworkStatus(with: path.status)
            }
        }
        monitor.start(queue: queue)
    }

    /// Updates the network status based on the given NWPath.Status.
    private func updateNetworkStatus(with status: NWPath.Status) {
        switch status {
        case .satisfied:
            print("Network connection is available.")
            self.status = .connected
        default:
            print("No network connection.")
            self.status = .disconnected
        }
    }
}
