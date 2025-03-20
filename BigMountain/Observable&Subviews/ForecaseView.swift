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

#Preview("One-Way", body: {
    ObservableAndSubview_OneWayView()
})

struct ObservableAndSubview_TwoWayView: View {
    @State private var oo = ForecastOO()
    
    var body: some View {
        NavigationStack {
            VStack {
                EditableWeatherView(forecast: oo)
                
                Divider()
                
                Text(oo.sevenDays.map { $0.day }, format: .list(type: .and, width: .narrow))
            }
            .font(.title)
            .navigationTitle("Weather")
        }
    }
}

struct EditableWeatherView: View {
    @Bindable var forecast: ForecastOO
    
    var body: some View {
        List($forecast.sevenDays) { $day in
            Label {
                TextField("Day", text: $day.day)
                    .textFieldStyle(.roundedBorder)
            } icon: {
                Image(systemName: day.icon)
            }
        }
        .tint(.pink)
    }
}

#Preview("Two-Way", body: {
    ObservableAndSubview_TwoWayView()
})
