//
//  GroupSharedModifiers.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/3/25.
//

import SwiftUI

struct GroupSharedModifiers: View {
    var body: some View {
        VStack {
            Text("Group")
            Group {
                Image(systemName: "leaf.arrow.circlepath")
                    .font(.largeTitle)
                    .padding()
                
                Text("Please Recycle")
            }
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
        }
        
        Text("VStack")
        VStack {
            Image(systemName: "leaf.arrow.circlepath")
                .font(.largeTitle)
                .padding()
            
            Text("Please Recycle")
        }
        .padding()
        .background(.blue)
        .foregroundStyle(.white)
        .cornerRadius(10)
    }
}

#Preview {
    GroupSharedModifiers()
}
