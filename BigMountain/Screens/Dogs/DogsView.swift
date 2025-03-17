//
//  DogsView.swift
//  BigMountain
//
//  Created by Pongt Chia on 17/3/25.
//

import SwiftUI

struct DogsView: View {
    @State private var oo = DogsOO()
    
    var body: some View {
        List(oo.data) { datum in
            Text(datum.name)
        }
        .font(.title)
        .onAppear {
            oo.fetch()
        }
    }
}

#Preview {
    DogsView()
}
