//
//  Json_DecodeIfPresentView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

struct Json_DecodeIfPresentView: View {
    @State private var oo = Json_DecodeIfPresentOO()
    
    var body: some View {
        VStack {
            HeaderView()
            
            GroupBox("Drink Order") {
                Text(oo.drinkOrder.drink)
                
                if let milk = oo.drinkOrder.milk {
                    Text("Milk: \(milk)")
                }
                
                Text("Sugar: \(oo.drinkOrder.sugarCubes)")
            }
            .padding()
            
            Text(oo.jsonError?.localizedDescription ?? "")
        }
        .task {
            oo.fetch()
        }
        .font(.title)
    }
}

#Preview {
    Json_DecodeIfPresentView()
}
