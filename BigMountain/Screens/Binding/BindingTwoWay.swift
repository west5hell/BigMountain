//
//  BindingTwoWay.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct Binding_TwoWay: View {
    @State private var name = "Sean Ching"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Two-Way Binding")
                .font(.largeTitle.bold())
            
            Text(name)
            
            EditNameSubview(name: $name)
        }
        .font(.title)
        .padding()
    }
}

struct EditNameSubview: View {
    @Binding var name: String
    
    var body: some View {
        GroupBox("Subview") {
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview("Binding Two-Way", body: {
    Binding_TwoWay()
})

#Preview("Edit name subview", body: {
    @Previewable @State var name = "Ponter Chia"
    return EditNameSubview(name: $name)
})
