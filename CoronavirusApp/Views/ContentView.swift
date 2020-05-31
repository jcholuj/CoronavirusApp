//
//  ContentView.swift
//  DemoTest
//
//  Created by Jędrzej Chołuj on 06/03/2020.
//  Copyright © 2020 Jędrzej Chołuj. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var worldStatsVM = WorldStatsViewModel()
    @ObservedObject private var countryListVM = CountryListViewModel()

    init() {
        self.worldStatsVM.loadWorldStats()
        self.countryListVM.loadCountriesSortedByCases()
    }

    var body: some View {
        VStack {
                Spacer(minLength: 50)
                ZStack {
                    Circle()
                        .stroke(Color.gray, lineWidth: 30)
                        .opacity(0.2)
                    Circle()
                        .trim(from: 0.0, to: CGFloat(worldStatsVM.worldStats.recoveredOverTotalAtWorld))
                        .stroke(Color.green, lineWidth: 30)
                        .rotationEffect(.degrees(-90))
                    Circle()
                        .trim(
                            from: CGFloat(worldStatsVM.worldStats.recoveredOverTotalAtWorld),
                            to: CGFloat(worldStatsVM.worldStats.activeOverTotalAtWorld + worldStatsVM.worldStats.recoveredOverTotalAtWorld))
                        .stroke(Color.orange, lineWidth: 30)
                        .rotationEffect(.degrees(-90))
                    Circle()
                        .trim(
                            from: CGFloat(worldStatsVM.worldStats.recoveredOverTotalAtWorld + worldStatsVM.worldStats.activeOverTotalAtWorld),
                            to: 1.0)
                        .stroke(Color.red, lineWidth: 30)
                        .rotationEffect(.degrees(-90))
                    .overlay(
                        HStack {
                            VStack {
                                HStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.green)
                                    .frame(width: 15, height: 15)
                                }
                                HStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.orange)
                                    .frame(width: 15, height: 15)
                                }
                                HStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.red)
                                    .frame(width: 15, height: 15)
                                }
                            }
                            VStack(spacing: 3) {
                                Text("Recovered")
                                    .lineLimit(1)
                                Text("Active")
                                    .lineLimit(1)
                                Text("Deaths")
                                    .lineLimit(1)
                            }
                            VStack(spacing: 3) {
                                Text(String(worldStatsVM.worldStats.totalRecovered))
                                Text(String(worldStatsVM.worldStats.totalActive))
                                Text(String(worldStatsVM.worldStats.totalDeaths))
                            }
                        }
                        .padding(5)
                    )}
                    .frame(width: 300, height: 300)
                Spacer(minLength: 30)
                VStack(spacing: 4) {
                    HStack {
                        Text("World Total Cases:")
                            .font(.title)
                        Text(String(worldStatsVM.worldStats.totalCases))
                            .font(.title)
                    }
                    HStack {
                        Text("Last update:")
                            .font(.subheadline)
                        Text(worldStatsVM.worldStats.statisticTakenAt)
                            .font(.subheadline)
                    }
                }
                .padding(20)
            CountryListView()
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct CircularBarView: View {
    @Binding var percantageValue: Float
    @State var color: Color
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 40)
                .opacity(0.2)
            Circle()
                .trim(from: 0, to: CGFloat(percantageValue))
                .stroke(color, lineWidth: 40)
                .rotationEffect(.degrees(-90))
        }
    }
}

struct ExtractedView: View {
    @State var value: Int
    @State var color: Color
    var body: some View {
        HStack {
            HStack {
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(color)
                    .frame(width: 20, height: 20)
                Text("Recovered:")
            }
            .lineLimit(1)
            Text(String(value))
        }
    }
}
