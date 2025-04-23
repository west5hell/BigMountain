//
//  Exercise_Transition.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct Exercise_Transition: View {
    @State private var step1 = true
    
    var body: some View {
        ZStack {
            Color("Background3")
            
            VStack(spacing: 60) {
                Spacer()
                
                if step1 {
                    Text("Ready to travel?")
                        .bold()
                        .foregroundStyle(Color("Secondary3"))
                        .transition(.move(edge: .leading))
                }
                
                if step1 {
                    VStack(spacing: 60) {
                        Image("traveling")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                            .animation(.easeIn(duration: 1), value: step1)
                        
                        Capsule()
                            .fill(Color("Secondary3"))
                            .frame(height: 100)
                            .offset(x: -50)
                            .animation(.easeInOut(duration: 0.6), value: step1)
                            .overlay {
                                Text("Let's go!")
                                    .foregroundStyle(Color("Foreground3"))
                            }
                            .animation(.easeOut(duration: 0.6), value: step1)
                    }
                    .transition(.move(edge: .leading))
                }
                
                Spacer()
            }
            .animation(.easeOut(duration: 1.1), value: step1)
            
            //  Step 2
            VStack(spacing: 5) {
                if step1 == false {
                    Text("Where do you want to go?")
                        .bold()
                        .padding(.horizontal, 50)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("Secondary3"))
                        .transition(.move(edge: .top))
                }
                
                if step1 == false {
                    TripDetailsView()
                        .transition(.move(edge: .trailing))
                }
                
                if step1 == false {
                    Image("airplane")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .padding(.bottom, 100)
                        .transition(.move(edge: .bottom))
                }
            }
            
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button {
                        step1.toggle()
                    } label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .rotationEffect(.degrees(step1 ? 180 : 0))
                    }
                    
                    if step1 == false {
                        Button {
                            step1.toggle()
                        } label: {
                            Image(systemName: "chevron.right.circle.fill")
                        }
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                }
                .font(.system(size: 50))
                .animation(.easeOut(duration: 1), value: step1)
            }
            .padding(.bottom, 75)
        }
        .font(.largeTitle)
        .tint(Color("Accent3"))
        .ignoresSafeArea()
    }
}

#Preview {
    Exercise_Transition()
}
