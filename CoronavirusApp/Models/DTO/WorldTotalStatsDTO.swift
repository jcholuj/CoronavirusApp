//
//  WorldTotalStatsDTO.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 30/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

struct WorldTotalStatsDTO: Codable {
    var totalCases: String
    var totalDeaths: String
    var totalRecovered: String
    var newCases: String
    var newDeaths: String
    var statisticTakenAt: String

    init() {
        totalCases = ""
        totalDeaths = ""
        totalRecovered = ""
        newCases = ""
        newDeaths = ""
        statisticTakenAt = ""
    }
}
