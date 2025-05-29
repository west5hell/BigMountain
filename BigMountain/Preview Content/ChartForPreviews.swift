//
//  ChartForPreviews.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

extension ChartModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: ChartModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        
        let chart = ChartModel(name: "Coding Progress", xAxisName: "Date", yAxisName: "Lines of Code")
        container.mainContext.insert(chart)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/dd"
        
        let calendar = Calendar.current
        let startDate = Date()
        
        var plots: [PlotModel] = []
        
        for i in 0..<7 {
            let date = calendar.date(byAdding: .day, value: i, to: startDate)!
            let label = dateFormatter.string(from: date)
            let value = Double.random(in: 100...1_000)
            let plotModel = PlotModel(plotOrder: i, label: label, value: value)
            plots.append(plotModel)
        }
        
        chart.plots = plots

        return container
    }
}
