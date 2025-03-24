//
//  RuleMarks.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI
import Charts

struct Chart_RuleMark_Annotation: View {
    @State private var plots = PlotInfo.fetchData()
    
    var body: some View {
        Chart(plots) { plot in
            LineMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
            
            RuleMark(y: .value("Goal", 65))
                .foregroundStyle(Color.orange)
                .lineStyle(StrokeStyle(lineWidth: 2, dash: [8]))
                .annotation {
                    Text("Goal (b)")
                }
                .annotation(alignment: .leading) {
                    Text("Goal (a)")
                }
                .annotation(position: .bottom, alignment: .trailing, spacing: 8) {
                    Text("Goal (c)")
                }
        }
        .padding()
    }
}

#Preview {
    Chart_RuleMark_Annotation()
}

struct Chart_RuleMark: View {
    @State private var plots = Schedule.fetchData()
    
    var body: some View {
        Chart(plots) { plot in
            RuleMark(
                xStart: .value("Start", plot.hourStart),
                xEnd: .value("End", plot.hourEnd),
                y: .value("Employee", plot.employee)
            )
        }
        .padding()
        .frame(height: 300)
    }
}

#Preview(body: {
    Chart_RuleMark()
})
