//
//  ViewModel.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 25/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation
import Combine

class CountryListViewModel: ObservableObject {

    @Published var countriesStats = [CountryStatsViewModel]()

    init() {
        loadCountriesSortedByCases()
    }

    func loadCountriesSortedByCases() {
        Networking().getAllCountriesStats(request: Request(
            endpoint: Endpoint().countriesStatsEndpoint).request) { (countries) in
            if let countries = countries {
                DispatchQueue.main.async {
                    self.countriesStats = countries.map { (country) -> CountryStatsViewModel in
                        return CountryStatsViewModel.init(countryStats: country)
                    }
                }
            } else {
                print("Error: Problem with loading countries data.")
            }
        }
    }

    func sortCountriesByName() {
        let isDescendingByName = zip(self.countriesStats,
                                     self.countriesStats.dropFirst())
            .allSatisfy({$0.0.name >= $0.1.name})
        self.countriesStats = isDescendingByName ? countriesStats.sorted(
            by: {$0.name < $1.name}) : countriesStats.sorted(by: {$0.name > $1.name})
    }

    func sortCountriesByDeaths() {
        let isDescendingByDeaths = zip(self.countriesStats,
                                       self.countriesStats.dropFirst())
            .allSatisfy({$0.0.deaths >= $0.1.deaths})
        self.countriesStats = isDescendingByDeaths ? countriesStats.sorted(
            by: {$0.deaths < $1.deaths}) : countriesStats.sorted(by: {$0.deaths > $1.deaths})
    }

    func sortCountriesByCases() {
        let isDescendingByCases = zip(self.countriesStats,
                                      self.countriesStats.dropFirst())
            .allSatisfy({$0.0.cases >= $0.1.cases})
        self.countriesStats = isDescendingByCases ? self.countriesStats.sorted(
            by: {$0.cases < $1.cases}) : self.countriesStats.sorted(by: {$0.cases > $1.cases})
    }

    func sortCountriesByRecovered() {
        let isDescendingByRecovered = zip(self.countriesStats,
                                          self.countriesStats.dropFirst())
            .allSatisfy({$0.0.recovered >= $0.1.recovered})
        self.countriesStats = isDescendingByRecovered ? countriesStats.sorted(
            by: {$0.recovered < $1.recovered}) : countriesStats.sorted(by: {$0.recovered > $1.recovered})
    }

}
