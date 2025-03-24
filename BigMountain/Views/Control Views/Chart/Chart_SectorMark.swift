//
//  Chart_SectorMark.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI
import Charts

struct Share: Identifiable {
    let id = UUID()
    let label: String
    let value: Decimal
    
    static func fetchData() -> [Share] {
        [
            Share(label: "Reagan", value: 35),
            Share(label: "Rod", value: 20),
            Share(label: "Celina", value: 20),
            Share(label: "Tessa", value: 25)
        ]
    }
}

struct Chart_SectorMark: View {
    let ownership = Share.fetchData()
    
    var body: some View {
        VStack {
            Chart(ownership) { owner in
                SectorMark(angle: .value("Share", owner.value), angularInset: 4)
                    .cornerRadius(8)
                    .blur(radius: owner.label == "Celina" ? 4 : 0)
            }
            .padding(.horizontal)
            
            Chart(ownership) { owner in
                SectorMark(angle: .value("Share", owner.value))
                    .foregroundStyle(by: .value("Owner", owner.label))
            }
        }
        .chartLegend(position: .bottom, alignment: .center)
        .dynamicTypeSize(.accessibility2)
        .padding()
    }
}

#Preview("Pie Chart") {
    Chart_SectorMark()
}

struct Chart_SectorMark_Donut: View {
    let ownership = Share.fetchData()
    
    var body: some View {
        VStack {
            Chart(ownership) { owner in
                SectorMark(
                    angle: .value("Share", owner.value),
                    innerRadius: MarkDimension.fixed(40)
                )
                .foregroundStyle(by: .value("Owner", owner.label))
                    
            }
            .padding(.horizontal)
            
            Chart(ownership) { owner in
                SectorMark(
                    angle: .value("Share", owner.value),
                    innerRadius: MarkDimension.ratio(0.5),
                    outerRadius: MarkDimension.inset(50)
                )
                .foregroundStyle(by: .value("Owner", owner.label))
            }
        }
        .chartLegend(position: .bottom, alignment: .center)
        .dynamicTypeSize(.accessibility2)
        .padding()
    }
}

#Preview("Donut Chart", body: {
    Chart_SectorMark_Donut()
})
