//
//  ObservableTwoWay.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct ObservableTwoWay: View {
    @State private var personClass = PersonClass()
    
    var body: some View {
        VStack {
            GroupBox("Name") {
                TextField("name", text: $personClass.name)
                    .textFieldStyle(.roundedBorder)
                
                Text(personClass.name)
            }
        }
        .font(.title)
    }
}

#Preview {
    ObservableTwoWay()
}


