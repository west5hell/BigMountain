//
//  Preference_ReduceFunction.swift
//  BigMountain
//
//  Created by Pongt Chia on 31/3/25.
//

import SwiftUI

struct Preference_ReduceFunction: View {
    @State private var highestValue = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Preference",
                subtitle: "Reduce Function",
                desc: "The reduce function is where you decide how to handle multiple preference values. Do you concatencate them? Do you sum them up? Do you pick the highest or lowest value?"
            )
            
            HStack {
                ForEach(33..<38) { item in
                    Image(systemName: "\(item).circle")
                        .preference(key: GetHighestValue.self, value: item)
                }
            }
            .onPreferenceChange(GetHighestValue.self) { value in
                highestValue = value
            }
            
            Text("Highest Number: \(highestValue)")
                .font(.title3)
        }
        .font(.title)
    }
}

#Preview {
    Preference_ReduceFunction()
}

struct GetHighestValue: PreferenceKey {
    static var defaultValue = 0
    
    static func reduce(value: inout Int, nextValue: () -> Int) {
        value = value > nextValue() ? value : nextValue()
    }
}
