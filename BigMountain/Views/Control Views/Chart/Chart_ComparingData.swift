//
//  Chart_ComparingData.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI
import Charts

struct Chart_ComparingData: View {
    @State private var plots = PlotInfo.fetchData()
    @State private var plots2 = [
        PlotInfo(x: "Quarter 1", y: 50),
        PlotInfo(x: "Quarter 2", y: 35),
        PlotInfo(x: "Quarter 3", y: 75),
        PlotInfo(x: "Quarter 4", y: 65)
    ]
    
    var body: some View {
        Chart {
            ForEach(plots) { plot in
                LineMark(
                    x: .value("Labels", plot.x),
                    y: .value("Values", plot.y),
                    series: .value("A", "A")
                )
                .foregroundStyle(Color.red)
            }
            
            
            ForEach(plots2) { info in
                LineMark(
                    x: .value("Lables", info.x),
                    y: .value("Values", info.y),
                    series: .value("B", "B")
                )
                .foregroundStyle(Color.purple)
            }
        }
    }
}

#Preview {
    Chart_ComparingData()
}
