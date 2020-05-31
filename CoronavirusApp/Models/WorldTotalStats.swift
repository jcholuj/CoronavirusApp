//
//  WorldTotalStats.swift
//  CoronavirusApp
//
//  Created by Jędrzej Chołuj on 30/05/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

class WorldTotalStats: Codable {
    var totalCases: Int = 1
    var totalDeaths: Int = 0
    var totalRecovered: Int = 0
    var statisticTakenAt: String = ""

    var totalActive: Int {
        return self.totalCases - self.totalDeaths - self.totalRecovered
    }

    var recoveredOverTotalAtWorld: Float {
        return Float(self.totalRecovered)/Float(self.totalCases)
    }

    var activeOverTotalAtWorld: Float {
        return Float(self.totalActive)/Float(self.totalCases)
    }

    var deathsOverTotalAtWorld: Float {
        return Float(self.totalDeaths)/Float(self.totalCases)
    }

    init() {}

    init(worldTotalStatsDTO: WorldTotalStatsDTO) {
        totalCases = worldTotalStatsDTO.totalCases.stringWithCommasToInt()
        totalDeaths = worldTotalStatsDTO.totalDeaths.stringWithCommasToInt()
        totalRecovered = worldTotalStatsDTO.totalRecovered.stringWithCommasToInt()
        statisticTakenAt = worldTotalStatsDTO.statisticTakenAt
    }
}
