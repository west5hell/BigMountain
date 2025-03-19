//
//  StateWithClassData.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

class NameClass {
    var firstName = ""
    var lastName = ""
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

struct StateWithClassData: View {
    @State private var name = NameClass(firstName: "Fernanda", lastName: "Cruz")
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "State",
                subtitle: "Working With Classes",
                desc: "A class can be used for a one-way bind.",
                back: .blue,
                textColor: .white
            )
            
            Text("Full Name:")
            Text("\(name.firstName) \(name.lastName)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            VStack {
                Text("Try updating the name:")
                TextField("first name", text: $name.firstName)
                TextField("last name", text: $name.lastName)
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            Spacer()
            DescView(
                "But it won't work for two-way binds. Notice the screen isn't updating the name.",
                back: .blue,
                textColor: .white
            )
        }
        .font(.title)
    }
}

#Preview {
    StateWithClassData()
}
