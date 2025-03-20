//
//  ForecastOO.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/3/25.
//

import SwiftUI

@Observable
class ForecastOO {
    var sevenDays = [Weather]()
    
    struct Weather: Identifiable {
        let id = UUID()
        var day = ""
        var icon = ""
    }
    
    init() {
        sevenDays = [
            Weather(day: "Sunday", icon: "cloud.snow.fill"),
            Weather(day: "Monday", icon: "sun.min.fill"),
            Weather(day: "Tuesday", icon: "sun.max.fill"),
            Weather(day: "Wednesday", icon: "cloud.sun.fill"),
            Weather(day: "Thursday", icon: "sun.min.fill"),
            Weather(day: "Friday", icon: "cloud.drizzle.fill"),
            Weather(day: "Saturday", icon: "cloud.sleet.fill"),
        ]
    }
    
    func updateSunday() {
        sevenDays[0].day = "Sunday (updated)"
        sevenDays[0].icon = "cloud.sun.fill"
    }
}
