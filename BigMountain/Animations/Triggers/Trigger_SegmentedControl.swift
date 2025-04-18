//
//  Trigger_SegmentedControl.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Trigger_SegmentedControl: View {
    @State private var segment = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "Triggers",
                subtitle: "Segmented Control",
                desc: "A segmented control (picker) can also trigger animations, such as sliding views into and out of place."
            )
            
            Picker("Dat & Night", selection: $segment) {
                Text("Text ☀️").tag(0)
                Text("Night 🌙").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .zIndex(1)
            
            GeometryReader { gp in
                ZStack {
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Image(systemName: "sun.max.fill")
                                .font(.system(size: 50))
                            Spacer()
                        }
                        .padding(.top, 24)
                        Text("The Day Report")
                        Spacer()
                    }
                    .background(
                        Image("day")
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.white)
                    .offset(x: segment == 0 ? 0 : -gp.size.width, y: 0)
                    .animation(.default, value: segment)
                    
                    VStack(spacing: 20) {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "moon.fill")
                                .font(.system(size: 50))
                            Spacer()
                        }
                        Text("The Night Report")
                            .padding(.bottom, 24)
                    }
                    .background(
                        Image("night")
                            .aspectRatio(contentMode: .fill)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundStyle(.white)
                    .offset(x: segment == 1 ? 0 : gp.size.width, y: 0)
                    .animation(.default, value: segment)
                }
                .shadow(radius: 15)
                .padding(.horizontal)
            }
        }
        .font(.title)
    }
}

#Preview {
    Trigger_SegmentedControl()
}
