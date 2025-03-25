//
//  ViewThatFits_Vertical.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct ViewThatFits_Vertical: View {
    var body: some View {
        ViewThatFits(in: .vertical) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.purple.opacity(0.7))
                .overlay {
                    Text("For Portrait")
                }
                .frame(width: 200, height: 500)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.7))
                .overlay {
                    Text("For Landscape")
                }
                .frame(width: 400, height: 100)
            
            Text("No views fit")
        }
    }
}

#Preview {
    ViewThatFits_Vertical()
}
