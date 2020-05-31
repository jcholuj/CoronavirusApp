//
//  LatestStatsByCountriesDTO.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 28/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

struct LatestStatsByCountriesDTO: Codable {
    var countryName: String
    var cases: String
    var newCases: String
    var activeCases: String
    var deaths: String
    var newDeaths: String
    var totalRecovered: String
    var seriousCritical: String
    var region: String?

    init() {
        countryName = ""
        cases = ""
        totalRecovered = ""
        deaths = ""
        activeCases = ""
        newCases = ""
        region = nil
        seriousCritical = ""
        newDeaths = ""
    }

}
