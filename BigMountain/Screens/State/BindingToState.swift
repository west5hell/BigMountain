//
//  BindingToState.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct BindingToState: View {
    @State private var name = "Marina"
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "State",
                subtitle: "Struct Variables",
                desc: "Add @State before the variable to make it mutable.",
                back: .blue,
                textColor: .white
            )
            
            Button {
                name = "Mark"
            } label: {
                Text("Change name to 'Mark'")
                    .padding()
                    .background(Capsule().stroke(.blue, lineWidth: 2))
            }
            Spacer()
            
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    BindingToState()
}
