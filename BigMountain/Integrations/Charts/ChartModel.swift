//
//  ChartModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

@Model
class ChartModel {
    var name: String
    var xAxisName: String
    var yAxisName: String
    @Relationship(deleteRule: .cascade, inverse: \PlotModel.chart)
    var plots: [PlotModel] = []

    init(
        name: String,
        xAxisName: String,
        yAxisName: String,
        plots: [PlotModel] = []
    ) {
        self.name = name
        self.xAxisName = xAxisName
        self.yAxisName = yAxisName
        self.plots = plots
    }

}

extension ChartModel {
    var viewSortedPlots: [PlotModel] {
        plots.sorted { $0.plotOrder < $1.plotOrder }
    }
}
