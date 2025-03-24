//
//  Chart_XAxisLabel.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI
import Charts

struct Chart_XAxisLabel: View {
    @State private var plots = PlotInfo.fetchData()
    
    var body: some View {
        Chart(plots) { plot in
            BarMark(x: .value("Labels", plot.x), y: .value("Values", plot.y))
        }
        .chartXAxisLabel("Quarters (a)")
        .chartXAxisLabel(content: {
            Text("Quarters (b)")
                .font(.title)
                .foregroundStyle(.purple)
                .padding(.top)
        })
        .chartXAxisLabel("Quarters (c)", position: .leading, alignment: .center, spacing: 8)
        .chartXAxisLabel(
            position: .top,
            alignment: .center,
            spacing: 8,
            content: {
                Text("Quarters (d)")
                    .font(.title3.weight(.bold))
                    .frame(width: 300)
                    .padding()
                    .background(
                        Color.blue.opacity(0.2),
                        in: RoundedRectangle(cornerRadius: 8)
                    )
        })
        .padding()
    }
}

#Preview {
    Chart_XAxisLabel()
}
