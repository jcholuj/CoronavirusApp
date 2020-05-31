//
//  Networking.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 24/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import Foundation

class Networking {

    var allCountries = [CountryStats]()
    var worldTotalStats = WorldTotalStats()

    func getWorldTotalStats(
        request: URLRequest,
        completion: @escaping (WorldTotalStats?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Unknown error")
            } else {
                if let data = data {
                    self.decodeWorldStats(data)
                    DispatchQueue.main.async {
                        completion(self.worldTotalStats)
                    }
                }
            }
        })
        dataTask.resume()
    }

    func decodeWorldStats(_ data: Data) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result: WorldTotalStatsDTO = try? jsonDecoder.decode(
            WorldTotalStatsDTO.self,
            from: data) {
            worldTotalStats = WorldTotalStats(worldTotalStatsDTO: result)
        }
    }

    func getAllCountriesStats(request: URLRequest, completion: @escaping ([CountryStats]?) -> Void) {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, _, error) -> Void in
            if error != nil {
                print(error?.localizedDescription ?? "Unknown error")
            } else {
                if let data = data {
                    self.decodeAllCountriesStats(data)
                    DispatchQueue.main.async {
                        completion(self.allCountries)
                    }
                }
            }
        })
        dataTask.resume()
    }

    func decodeAllCountriesStats(_ data: Data) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        if let result: CountriesStatDTO = try? jsonDecoder.decode(CountriesStatDTO.self, from: data) {
            let countries = result.countriesStat.map { (data) -> CountryStats in
                let country = CountryStats(latestStatsByCountriesDTO: data)
                return country
            }
            allCountries.append(contentsOf: countries.sorted(by: {$0.cases > $1.cases}))
        }
    }
}
