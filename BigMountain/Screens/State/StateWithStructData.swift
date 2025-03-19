//
//  StateWithStructData.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct NameData {
    var firstName = ""
    var lastName = ""
}

struct StateWithStructData: View {
    @State private var nameData = NameData()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            
            Text("Full Name:")
            Text("\(nameData.firstName) \(nameData.lastName)")
                .font(.largeTitle)
                .fontWeight(.black)
            
            Group {
                Text("First and last names are both in the same struct.")
                TextField("first name", text: $nameData.firstName)
                TextField("last name", text: $nameData.lastName)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal)
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    StateWithStructData()
}
