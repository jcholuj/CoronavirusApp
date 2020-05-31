//
//  WorldStatsViewModel.swift
//  CoronavirusApp
//
//  Created by Jędrzej Chołuj on 30/05/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

class WorldStatsViewModel: ObservableObject {

    @Published var worldStats = WorldTotalStats()

    init() {
        loadWorldStats()
    }

    func loadWorldStats() {
        Networking().getWorldTotalStats(request: Request(
            endpoint: Endpoint().worldTotalStatsEndpoint).request) { (worldStats) in
            if let worldStats = worldStats {
                DispatchQueue.main.async {
                    self.worldStats = worldStats
                }
            } else {
                print("Error: Problem with loading world data.")
            }
        }
    }
}
