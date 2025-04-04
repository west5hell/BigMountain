//
//  Preference_WidestTextView.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct UtilityModel: Identifiable {
    let id = UUID()
    var utility = ""
    var q1 = ""
    var q2 = ""
}

struct Preference_WidestTextView: View {
    @State private var widestWidth: CGFloat = 0.0
    @State var data = [
        UtilityModel(utility: "Electricity", q1: "$78.25", q2: "$0.32"),
        UtilityModel(utility: "Gas", q1: "$1,123.01", q2: "$88.05"),
        UtilityModel(utility: "Water", q1: "$3.01", q2: "$1,322.05")
    ]
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Preference",
                subtitle: "Widest Text View",
                desc: "Sometimes you want to get the widest text view to set your other text views in a list of data."
            )
            
            Text("Widest Width: \(widestWidth)")
            
            VStack(spacing: 16) {
                ForEach(data) { datum in
                    HStack(spacing: 16) {
                        Text(datum.utility)
                        Spacer()
                        Text(datum.q1)
                        Text(datum.q2)
                            .fixedSize()
                            .background(
                                GeometryReader { gp in
                                    Color.clear
                                        .preference(key: WidestWidth.self, value: gp.size.width)
                                }
                            )
                            .frame(width: widestWidth, alignment: .trailing)
                    }
                }
                .padding(.horizontal)
            }
            .onPreferenceChange(WidestWidth.self) { value in
                widestWidth = value
            }
        }
        .font(.title3)
    }
}

#Preview {
    Preference_WidestTextView()
}

struct WidestWidth: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = value > nextValue() ? value : nextValue()
    }
}
