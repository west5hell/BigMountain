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
//                    ChartView(chart: chart)
                    Last7ChartView(chart: chart)
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

struct Last7ChartView: View {
    private let chart: ChartModel
    @Query private var plots: [PlotModel]
    
    init(chart: ChartModel) {
        self.chart = chart
        let chartId = chart.chartId
        var fetch = FetchDescriptor<PlotModel>()
        let sort = [SortDescriptor(\PlotModel.plotOrder, order: .reverse)]
        let filter = #Predicate<PlotModel> {plot in
            plot.chartId == chartId
        }
        fetch.fetchLimit = 7
        fetch.predicate = filter
        fetch.sortBy = sort
        _plots = Query(fetch)
    }
    var body: some View {
        VStack {
            Chart {
                ForEach(plots.reversed()) { plot in
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
