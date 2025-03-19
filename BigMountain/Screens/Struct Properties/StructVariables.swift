//
//  StructVariables.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct StructVariables: View {
    var name = "Mariana"    // Immutable. Cannot be changed.
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "State",
                subtitle: "Struct Variables",
                desc: "Variables in structs are immutable. Mutable means a variable can change. Immutable means a variable can NOT change.",
                back: .blue,
                textColor: .white
            )
            
            Button {
//                self.name = "Mark"  // Error: Cannot assign to proprety: 'self' is immutable
            } label: {
                Text("Change Name to 'Mark'")
                    .padding()
                    .background(Capsule().stroke(Color.blue, lineWidth: 2))
            }
            
            Spacer()
            
            Text("Name:")
            Text("\(name)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Spacer()
            
            DescView("The name variable is read-only and cannot be updated.", back: .blue, textColor: .white)
        }
        .font(.title)
    }
}

#Preview {
    StructVariables(name: "Mark")
}
