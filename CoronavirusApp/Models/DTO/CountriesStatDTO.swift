//
//  CountriesStatDTO.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 28/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

struct CountriesStatDTO: Codable {
    var countriesStat: [LatestStatsByCountriesDTO]

    init() {
        countriesStat = [LatestStatsByCountriesDTO()]
    }
}
