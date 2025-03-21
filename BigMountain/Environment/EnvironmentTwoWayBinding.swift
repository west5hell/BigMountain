//
//  EnvironmentTwoWayBinding.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

@Observable
class AddressOO {
    var state = "Vermont"
}

struct EnvironmentTwoWayBinding: View {
    @Environment(AddressOO.self) private var addressOO
    
    var body: some View {
        Form {
            @Bindable var addressBindable = addressOO
            
            Section("One-Way Binding") {
                Text("State: \(addressOO.state)")
                    .bold()
            }
            
            Section("Two-Way Binding") {
                TextField("Enter State", text: $addressBindable.state)
            }
        }
        .headerProminence(.increased)
    }
}

#Preview {
    EnvironmentTwoWayBinding()
        .environment(AddressOO())
}
