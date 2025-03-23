//
//  Button.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/3/25.
//

import SwiftUI

struct RegularButton: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Regular Button") {
                
            }
            
            Button {
                
            } label: {
                Text("Regular Button")
                    .bold()
            }
        }
        .font(.title)
    }
}

#Preview("Regular Button", body: {
    RegularButton()
})

struct Button_TextModifiers: View {
    var body: some View {
        VStack(spacing: 40) {
            Button {
                
            } label: {
                Text("Forgot Passowrd")
                Text("Tap to Recover")
                    .foregroundStyle(.orange)
            }

            Button(action: {}) {
                VStack {
                    Text("New User")
                    Text("(Register Here)").font(.body)
                }
            }
        }
        .font(.title)
    }
}

#Preview("Text Composition", body: {
    Button_TextModifiers()
})

struct Button_WithBackgrouds: View {
    var body: some View {
        VStack(spacing: 60) {
            Button(action: {}) {
                Text("Solid Button")
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.purple)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            Button(action: {}) {
                Text("Button With Shadow")
                    .padding(12)
                    .foregroundStyle(.white)
                    .background(Color.purple)
                    .shadow(color: Color.purple, radius: 20, y: 5)
            }
            Button(action: {}) {
                Text("Button With Rounded Ends")
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .foregroundStyle(.white)
                    .background(Color.purple, in: Capsule())
            }
        }
        .font(.title)
    }
}

#Preview("With Backgrounds", body: {
    Button_WithBackgrouds()
})

struct Button_ButtonStyle: View {
    var body: some View {
        VStack(spacing: 80) {
            Button("Automatic") {}
                .buttonStyle(.automatic)
            
            Button("Bordered") {}
                .buttonStyle(.bordered)
            
            Button("BorderedProminent") {}
                .buttonStyle(.borderedProminent)
            
            Button("Borderless") {}
                .buttonStyle(.borderless)
            
            Button("Plain") {}
                .buttonStyle(.plain)
        }
        .font(.title)
        .tint(.purple)
    }
}

#Preview("ButtonStyle", body: {
    Button_ButtonStyle()
})

struct Button_Role: View {
    var body: some View {
        VStack(spacing: 100) {
            Button("Normal") {}
            
            Button("Destructive", role: .destructive) {}
            
            Button("Destructive", role: .destructive, action: {})
                .buttonStyle(.borderedProminent)
            
            Button("Cancel", role: .cancel, action: {})
        }
        .buttonStyle(.bordered)
        .controlSize(.large)
        .font(.title)
    }
}

#Preview("Button Role", body: {
    Button_Role()
})
