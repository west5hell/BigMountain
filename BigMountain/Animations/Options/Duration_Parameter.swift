//
//  Duration_Parameter.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Duration_Parameter: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(
                "Animation Options",
                subtitle: "Duration Parameter",
                desc: "To set a duration, you need to turn the animatin type into a function. Like .easeInOut into .easeInOut(duration: 1)."
            )
            
            Text("Duration: Default")
            Image(systemName: "hare.fill")
                .foregroundStyle(.purple)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150, y: 0)
                .animation(.easeOut, value: change)
            
            Text("Duration: 2 Seconds")
            Image(systemName: "tortoise.fill")
                .foregroundStyle(.purple)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150, y: 0)
                .animation(.easeOut(duration: 2), value: change)
            
            Button("Change") {
                change.toggle()
            }
            
            DescView("Note: The default animation duration in SwiftUI is less than a second. Somewhere around 0.4 seconds.")
        }
        .font(.title)
    }
}

#Preview {
    Duration_Parameter()
}
