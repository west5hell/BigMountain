//
//  DatePicker_Customizing.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct DatePicker_Customizing: View {
    @State private var date = Date()
    
    var body: some View {
        VStack(spacing: 30) {
            HeaderView(
                "DatePicker",
                subtitle: "Customizing",
                desc: "Customize the background and accent color:",
                back: .green
            )
            
            DatePicker("Birthday", selection: $date, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .tint(.green)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green)
                        .opacity(0.1)
                        .shadow(radius: 1, x: 4, y: 4)
                )
                .padding(.horizontal)
            
            DatePicker("Today", selection: $date, displayedComponents: .date)
                .frame(height: 50)
                .padding()
                .background(
                    Rectangle()
                        .fill(Color.green)
                        .shadow(radius: 4)
                        .opacity(0.2)
                )
        }
        .font(.title)
    }
}

#Preview {
    DatePicker_Customizing()
}
