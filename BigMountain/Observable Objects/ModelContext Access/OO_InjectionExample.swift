//
//  OO_InjectionExample.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/5/25.
//

import SwiftUI
import SwiftData

@Observable
class InjectedModelContextOO {
    private let modelContext: ModelContext
    var planets: [PlanetModel] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
}

struct OO_InjectionExample: View {
    @State private var oo: InjectedModelContextOO
    
    init(modelContext: ModelContext) {
        self.oo = InjectedModelContextOO(modelContext: modelContext)
    }
    
    var body: some View {
        List(oo.planets) { planet in
            Text(planet.name)
        }
    }
}

#Preview {
    OO_InjectionExample(modelContext: PlanetModel.preview.mainContext)
}
