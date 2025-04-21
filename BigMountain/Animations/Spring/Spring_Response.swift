//
//  Spring_Response.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/4/25.
//

import SwiftUI

struct Spring_Response: View {
    @State private var show = false
    @State private var response = 0.55
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                center: .center,
                startRadius: 10,
                endRadius: 400
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HeaderView(
                    "Spring",
                    subtitle: "Response",
                    desc: "Using the response parameter you can adjust the spring's response to being activated. Will it respond quickly or slowly?"
                )
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay {
                        Image("Phone")
                    }
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(response: response, dampingFraction: 0.5), value: show)
                
                Button {
                    show.toggle()
                } label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundStyle(Color("Gold"))
                        .font(.largeTitle)
                }
                .tint(Color("Accent"))
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $response, in: 0...4)
                    Image(systemName: "4.circle.fill")
                }
                .foregroundStyle(Color("Gold"))
                .padding()

            }
        }
        .font(.title)
    }
}

#Preview {
    Spring_Response()
}
