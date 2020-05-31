//
//  CountryStatsViewModel.swift
//  CoronavirusApp
//
//  Created by Jędrzej Chołuj on 31/05/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

class CountryStatsViewModel: Identifiable {

    var countryStats: CountryStats

    init(countryStats: CountryStats) {
        self.countryStats = countryStats
    }

    var countryId = UUID()

    var name: String {
        return self.countryStats.name
    }

    var cases: Int {
        return self.countryStats.cases
    }

    var active: Int {
        return self.countryStats.activeCases
    }

    var deaths: Int {
        return self.countryStats.deaths
    }

    var recovered: Int {
        return self.countryStats.totalRecovered
    }

    var deathsOverTotalAtCountry: Float {
        return Float(self.countryStats.deaths)/Float(self.countryStats.cases)
    }

    var activeOverTotalAtCountry: Float {
        return Float(self.countryStats.activeCases)/Float(self.countryStats.cases)
    }

    var recoveredOverTotalAtCountry: Float {
        return Float(self.countryStats.totalRecovered)/Float(self.countryStats.cases)
    }

}

extension CountryStatsViewModel: Comparable {

    static func < (lhs: CountryStatsViewModel, rhs: CountryStatsViewModel) -> Bool {
        lhs.deaths < rhs.deaths || lhs.cases < rhs.cases || lhs.recovered < rhs.recovered || lhs.name < rhs.name
    }

    static func == (lhs: CountryStatsViewModel, rhs: CountryStatsViewModel) -> Bool {
        lhs.deaths == rhs.deaths || lhs.cases == rhs.cases || lhs.recovered == rhs.recovered || lhs.name == rhs.name
    }
}
