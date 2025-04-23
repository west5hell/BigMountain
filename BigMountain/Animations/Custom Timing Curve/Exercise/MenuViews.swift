//
//  MenuViews.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct MenuViews: View {
    @Binding var showMenus: Bool
    
    var blurRadius: CGFloat = 4
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                VStack(spacing: 25) {
                    Text("Stats")
                        .fontWeight(.thin)
                        .padding()
                    Button {
                        
                    } label: {
                        Image(systemName: "stopwatch")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .buttonStyle(ButtonStyleThinOutline())
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "bolt.heart")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .buttonStyle(ButtonStyleThinOutline())
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "scale.3d")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .buttonStyle(ButtonStyleThinOutline())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Background4").opacity(0.95))
                        .shadow(radius: 8)
                )
                .scaleEffect(showMenus ? 1 : 0.8)
                .blur(radius: showMenus ? 0 : blurRadius)
                .offset(x: showMenus ? 0 : -90)
                .animation(showMenus ? .timingCurve(0, -2, 1, 0, duration: 1) : .timingCurve(0, 1, 0, 1.5, duration: 1), value: showMenus)
                
                VStack(spacing: 25) {
                    Text("Exercise")
                        .fontWeight(.thin)
                        .padding()
                    Button {
                        
                    } label: {
                        Image(systemName: "figure.jumprope")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .buttonStyle(ButtonStyleThinOutline())
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "dumbbell")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .buttonStyle(ButtonStyleThinOutline())
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "duffle.bag")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .buttonStyle(ButtonStyleThinOutline())
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Background4").opacity(0.95))
                        .shadow(radius: 8)
                )
                .scaleEffect(showMenus ? 1 : 0.8)
                .blur(radius: showMenus ? 0 : blurRadius)
                .offset(x: showMenus ? 0 : 90)
                .animation(showMenus ? .timingCurve(0, -2, 1, 0, duration: 1) : .timingCurve(0, 1, 0, 1.5, duration: 1), value: showMenus)
            }
            
            Button {
                showMenus.toggle()
            } label: {
                Text("Done")
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(ButtonStyleThinOutline())
            .offset(y: showMenus ? 0 : 300)
            .blur(radius: showMenus ? 0 : blurRadius)
            .animation(.easeIn(duration: 1), value: showMenus)
        }
        .padding(.horizontal)
        .zIndex(showMenus ? 1 : 0)
    }
}

#Preview {
    ZStack {
        Color("Secondary4")
            .ignoresSafeArea()
        MenuViews(showMenus: .constant(true))
    }
}
