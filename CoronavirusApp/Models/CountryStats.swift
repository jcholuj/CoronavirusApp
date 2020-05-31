//
//  CountryStat.swift
//  CoronavirusApp
//
//  Created by Jędrzej Chołuj on 30/05/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

struct CountryStats: Codable, Hashable {

    var name: String
    var cases: Int
    var activeCases: Int
    var deaths: Int
    var totalRecovered: Int

    init(latestStatsByCountriesDTO: LatestStatsByCountriesDTO) {
        name = latestStatsByCountriesDTO.countryName
        cases = latestStatsByCountriesDTO.cases.stringWithCommasToInt()
        totalRecovered = latestStatsByCountriesDTO.totalRecovered.stringWithCommasToInt()
        deaths = latestStatsByCountriesDTO.deaths.stringWithCommasToInt()
        activeCases = latestStatsByCountriesDTO.activeCases.stringWithCommasToInt()
    }
}

extension CountryStats: Comparable {
    static func < (lhs: CountryStats, rhs: CountryStats) -> Bool {
        lhs.deaths < rhs.deaths || lhs.cases < rhs.cases || lhs.totalRecovered < rhs.totalRecovered || lhs.name < rhs.name
    }
}
