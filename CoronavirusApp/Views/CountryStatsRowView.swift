//
//  CountryStatsRowView.swift
//  CoronavirusApp
//
//  Created by Jędrzej Chołuj on 30/05/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import SwiftUI

struct CountryStatsRowView: View {
    @State var country: String
    @State var total: String
    @State var recovered: String
    @State var deaths: String

    var body: some View {
        HStack {
            Text(country)
                .foregroundColor(.black)
                .frame(width: 100)
            Text(total)
                .foregroundColor(.black)
                .frame(width: 80)
            Text(recovered)
                .foregroundColor(.green)
                .frame(width: 80)
            Text(deaths)
                .foregroundColor(.red)
                .frame(width: 80)
        }
        .lineLimit(1)
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 30, alignment: .center)
    }
}

struct CountryStatsRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatsRowView(country: "", total: "", recovered: "", deaths: "")
    }
}
