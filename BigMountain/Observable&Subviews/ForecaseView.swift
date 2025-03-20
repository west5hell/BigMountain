//
//  ForecaseView.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/3/25.
//

import SwiftUI

struct ObservableAndSubview_OneWayView: View {
    @State private var oo = ForecastOO()
    
    var body: some View {
        NavigationStack {
            VStack {
                WeatherView(forecast: oo)
                
                Button("Update") {
                    oo.updateSunday()
                }
                .buttonStyle(.borderedProminent)
            }
            .font(.title)
            .navigationTitle("Weather")
        }
    }
}

struct WeatherView: View {
    var forecast: ForecastOO
    
    var body: some View {
        List(forecast.sevenDays) {day in
            Label(day.day, systemImage: day.icon)
        }
        .tint(.pink)
    }
}

#Preview(body: {
    ObservableAndSubview_OneWayView()
})
