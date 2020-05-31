//
//  CountryListView.swift
//  CoronavirusApp
//
//  Created by Jędrzej Chołuj on 30/05/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import SwiftUI

struct CountryListView: View {

    @ObservedObject private var countryListVM = CountryListViewModel()

    init() {
        self.countryListVM.loadCountriesSortedByCases()
    }

    var body: some View {
        VStack {
            List {
                Section(header: ListHeaderView(countryListVM: countryListVM)) {
                    ForEach(self.countryListVM.countriesStats) { country in
                        CountryStatsRowView(country: country.name,
                                            total: "\(country.cases)",
                                            recovered: "\(country.recovered)",
                                            deaths: "\(country.deaths)")
                    }
                }
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
