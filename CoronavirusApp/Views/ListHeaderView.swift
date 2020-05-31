//
//  ListHeaderView.swift
//  CoronavirusApp
//
//  Created by Jędrzej Chołuj on 30/05/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import SwiftUI

struct ListHeaderView: View {

    @ObservedObject var countryListVM: CountryListViewModel

    var body: some View {
        HStack {
            Button(action: {
                self.countryListVM.sortCountriesByName()
            }, label: {
                Text("Country")
                    .frame(width: 100)
            })
            Button(action: {
                self.countryListVM.sortCountriesByCases()
            }, label: {
                Text("Total")
                    .frame(width: 80)
            })
            Button(action: {
                self.countryListVM.sortCountriesByRecovered()
                }, label: {
                Text("Cured")
                    .frame(width: 80)
            })
            Button(action: {
                self.countryListVM.sortCountriesByDeaths()
            }, label: {
                Text("Deaths")
                    .frame(width: 80)
            })
        }
        .foregroundColor(Color.black)
        .font(.headline)
        .lineLimit(1)
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 40, alignment: .center)
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(countryListVM: CountryListViewModel())
    }
}
