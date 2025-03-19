//
//  StateWithPicker.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct StateWithPicker: View {
    private let names = ["Mark", "Chris", "Scott", "Sean", "Paul"]
    @State private var selectedName = "Scott"
    
    var body: some View {
        VStack(spacing: 15) {
            HeaderView()
            
            Spacer()
            
            Picker("Name", selection: $selectedName) {
                ForEach(names, id: \.self) { name in
                    Text("\(name)")
                }
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            
            Button("Reset") {
                selectedName = "Scott"
            }
            
            Spacer()
            
            DescView()
            
            Text("Selected: \(selectedName)")
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    StateWithPicker()
}
