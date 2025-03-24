//
//  Chart.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI
import Charts

struct PlotInfo: Identifiable {
    let id = UUID()
    var x = ""
    var y = 0
    
    static func fetchData() -> [PlotInfo] {
        [
            PlotInfo(x: "Quarter 1", y: 75),
            PlotInfo(x: "Quarter 2", y: 25),
            PlotInfo(x: "Quarter 3", y: 100),
            PlotInfo(x: "Quarter 4", y: 50)
        ]
    }
}

struct Schedule: Identifiable {
    let id = UUID()
    var employee = ""
    var hourStart = 0
    var hourEnd = 0
    
    static func fetchData() -> [Schedule] {
        [
            Schedule(employee: "Chris", hourStart: 8, hourEnd: 16),
            Schedule(employee: "Rod", hourStart: 7, hourEnd: 15),
            Schedule(employee: "Lem", hourStart: 9, hourEnd: 17),
            Schedule(employee: "Chase", hourStart: 6, hourEnd: 14)
        ]
    }
}

struct ChartView: View {
    @State private var data = [75, 25, 100, 50]
    @State private var plots = PlotInfo.fetchData()
    
    var body: some View {
        ScrollView {
            VStack {
                //  Basics
                Chart {
                    BarMark(x: PlottableValue.value("Label 1", "Day 1"))
                    BarMark(x: PlottableValue.value("Label 2", "Day 2"))
                }
                .padding()
                
                //  The Y Value
                Chart {
                    BarMark(
                        x: .value("Label 1", "Day 1"),
                        y: .value("Value", 75)
                    )
                    BarMark(
                        x: .value("Label 2", "Day 2"),
                        y: .value("Value", 25)
                    )
                }
                
                //  Horizontal Charts
                Chart {
                    BarMark(x: .value("Value", 75), y: .value("Label 1", "Day 1"))
                    BarMark(x: .value("Value", 25), y: .value("Label 2", "Day 2"))
                }
                .frame(height: 400)
                
                //  With Data
                Chart(data, id: \.self) { datum in
                    BarMark(x: .value("Labels", "\(datum)"), y: .value("Values", datum))
                }
                
                //  With For Each
                Chart {
                    ForEach(data, id: \.self) { datum in
                        BarMark(x: .value("Labels", "\(datum)"), y: .value("Values", datum))
                    }
                }
                
                //  With Objects
                Chart(plots) { plot in
                    BarMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
                }
                
                Chart(plots) { plot in
                    LineMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
                }
                
                Chart(plots) { plot in
                    AreaMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
                }
                
                Chart(plots) { plot in
                    PointMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
                }
                
                Chart(plots) { plot in
                    RectangleMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
                }
            }
        }
    }
}

#Preview {
    ChartView()
}
