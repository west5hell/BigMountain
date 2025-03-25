//
//  Scrollview_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI

struct Scrollview_Intro: View {
    @State private var names = ["Scott", "Mark", "Chris", "Sean", "Rod", "Meng", "Natasha", "Chase", "Evans", "Paul", "Durtschi", "Max"]
    
    var body: some View {
        ScrollView {
            ForEach(names, id: \.self) { name in
                HStack {
                    Text(name).foregroundStyle(.primary)
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.green)
                    Spacer()
                }
                .padding()
                .background(
                    Color.white
                        .shadow(.drop(radius: 1, y: 1)),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .padding(.bottom, 4)
            }
            .padding(.horizontal)
        }
        .safeAreaInset(edge: .bottom, content: {
            VStack {
                Divider()
                Text("12 People")
            }
            .background(.regularMaterial)
        })
        .font(.title)
    }
}

#Preview {
    Scrollview_Intro()
}
