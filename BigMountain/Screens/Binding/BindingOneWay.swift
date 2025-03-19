//
//  BindingOneWay.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct Binding_OneWay: View {
    @State private var name = "Sean Ching"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("One-Way Binding")
                .font(.largeTitle.bold())
            
            TextField("name", text: $name)
                .textFieldStyle((.roundedBorder))
            
            NameSubview(name: name)
        }
        .font(.title)
        .padding()
    }
}

struct NameSubview: View {
    var name: String
    
    var body: some View {
        GroupBox("Subview") {
            Text(name)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    Binding_OneWay()
}
