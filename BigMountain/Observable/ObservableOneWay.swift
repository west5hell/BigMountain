//
//  ObservableOneWay.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

@Observable
class PersonClass {
    var name = ""
}

struct ObservableOneWay: View {
    private var personClass = PersonClass()
    
    var body: some View {
        VStack {
            Button("Add Name") {
                personClass.name = "Natalie Miles"
            }
            .buttonStyle(.borderedProminent)
            
            GroupBox("Name") {
                Text(personClass.name)
            }
        }
        .font(.title)
    }
}

#Preview {
    ObservableOneWay()
}
