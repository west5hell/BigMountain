//
//  Popup.swift
//  BigMountain
//
//  Created by Pongt Chia on 18/4/25.
//

import SwiftUI

struct Popup: View {
    @State private var showPopup = true
    @GestureState private var popupOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Button("Show Popup") {
                    showPopup = true
                }
            }
            .font(.title)
            .blur(radius: showPopup ? 2 : 0)
            .animation(.easeOut, value: showPopup)
            
            if showPopup {
                ZStack {
                    Color.black
                        .opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showPopup = false
                        }
                    
                    VStack(spacing: 20) {
                        Text("Drag popup off the screen")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.yellow)
                        Spacer()
                        Text("You can also tap outside of the popup to close")
                        Spacer()
                        Button("Or Tap This Button to Close") {
                            showPopup = false
                        }
                        .padding(.bottom)
                    }
                    .frame(height: 300)
                    .background()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 20)
                    .padding(.horizontal, 25)
                    .offset(popupOffset)
                    .gesture(
                        DragGesture(minimumDistance: 100)
                            .updating($popupOffset, body: { value, popupOffset, transaction in
                                popupOffset = value.translation
                            })
                            .onEnded({ value in
                                showPopup = false
                            })
                    )
                }
                .animation(.default, value: showPopup)
            }
        }
        .animation(.easeIn, value: showPopup)
    }
}

#Preview {
    Popup()
}
