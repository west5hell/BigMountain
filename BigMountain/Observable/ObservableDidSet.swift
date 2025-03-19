//
//  ObservableDidSet.swift
//  BigMountain
//
//  Created by Pongt Chia on 20/3/25.
//

import SwiftUI

@Observable
class PersonOO {
    var name = ""
//    {
//        willSet {
//            
//        }
//        didSet {
//            validationColor = name.isEmpty ? .red : .green
//        }
//    }
    
    var validationColor = Color.red
}


struct ObservableDidSet: View {
    @State private var oo = PersonOO()
    
    var body: some View {
        TextField("name", text: $oo.name)
            .padding()
            .background(oo.validationColor, in: .rect(cornerRadius: 8).stroke())
            .padding()
            .onChange(of: oo.name) { oldValue, newValue in
                oo.validationColor = newValue.isEmpty ? .red : .green
            }
    }
}

#Preview {
    ObservableDidSet()
}
