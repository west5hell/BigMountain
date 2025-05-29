//
//  PlotModel.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import SwiftData
import SwiftUI

@Model
class PlotModel {
    var chartId: UUID
    var plotOrder: Int
    var label: String
    var value: Double
    var chart: ChartModel?

    init(
        chartId: UUID,
        plotOrder: Int,
        label: String = "",
        value: Double = 0.0,
        chart: ChartModel? = nil
    ) {
        self.chartId = chartId
        self.plotOrder = plotOrder
        self.label = label
        self.value = value
        self.chart = chart
    }
}
