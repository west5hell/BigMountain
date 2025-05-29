//
//  ChartsView.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import Charts
import SwiftData
import SwiftUI

struct ChartsView: View {
    @Query private var charts: [ChartModel]

    var body: some View {
        NavigationStack {
            List(charts) { chart in
                NavigationLink {
                    ChartView(chart: chart)
                } label: {
                    Label {
                        Text(chart.name)
                    } icon: {
                        Image(systemName: "chart.xyaxis.line")
                    }
                    .font(.title)
                    .padding(8)
                }
            }
            .navigationTitle("Charts")
        }
    }
}

#Preview {
    ChartsView()
        .modelContainer(ChartModel.preview)
}

struct ChartView: View {
    let chart: ChartModel

    var body: some View {
        VStack {
            Chart {
                ForEach(chart.viewSortedPlots) { plot in
                    LineMark(
                        x: .value("Label", plot.label),
                        y: .value("Values", plot.value)
                    )
                }
            }
            .chartXAxisLabel(position: .bottom) {
                Text(chart.xAxisName)
                    .font(.title2)
            }
            .chartYAxisLabel(position: .leading) {
                Text(chart.yAxisName)
                    .font(.title2)
            }
            .padding()
        }
        .navigationTitle(chart.name)
    }
}
