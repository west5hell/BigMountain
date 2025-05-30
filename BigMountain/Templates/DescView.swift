//
//  DescView.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

struct DescView: View {
    var desc = "Use this to…"
    
    init(
        _ desc: String = "Use this to…",
    ) {
        self.desc = desc
    }
    
    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundStyle(.white)
    }
}

//#Preview {
//    DescView()
//}
