//
//  Chart_Dates.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI
import Charts

struct DailyInfo: Identifiable {
    let id = UUID()
    let x: Date
    let y: Int
    
    static func fetchData() -> [DailyInfo] {
        [
            DailyInfo(x: Date.from(2023, 1, 15), y: 75),
            DailyInfo(x: Date.from(2023, 2, 15), y: 25),
            DailyInfo(x: Date.from(2023, 3, 15), y: 100),
            DailyInfo(x: Date.from(2023, 4, 15), y: 50)
        ]
    }
}

struct Chart_Dates: View {
    @State private var plots = DailyInfo.fetchData()
    
    var body: some View {
        Chart(plots) {
            BarMark(
                x: .value("Labels", $0.x, unit: .month),
                y: .value("Values", $0.y)
            )
        }
        .padding()
    }
}

#Preview {
    Chart_Dates()
}

extension Date {
    static func from(_ year: Int, _ month: Int, _ day: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = DateComponents(calendar: calendar, year: year, month: month, day: day)
        return calendar.date(from: dateComponents)!
    }
}
