//
//  DescView.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

struct DescView: View {
    var desc = "Use this to…"
    var back = Color.orange
    var textColor = Color.black
    
    init(
        _ desc: String = "Use this to…",
        back: Color = Color.orange,
        textColor: Color = Color.black
    ) {
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    var body: some View {
        Text(desc)
            .frame(maxWidth: .infinity)
            .padding()
            .background(back)
            .foregroundStyle(textColor)
    }
}

//#Preview {
//    DescView()
//}
