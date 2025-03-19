//
//  StateWithModifiers.swift
//  BigMountain
//
//  Created by Pongt Chia on 19/3/25.
//

import SwiftUI

struct StateWithModifiers: View {
    @State private var isOn = true
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            Spacer()
            
            Button {
                isOn.toggle()
            } label: {
                ZStack(alignment: isOn ? .trailing : .leading) {
                    HStack {
                        Text("ON").opacity(isOn ? 1 : 0)
                        Text("OFF").opacity(isOn ? 0 : 1)
                    }
                    .foregroundStyle(.white)
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .frame(width: 45, height: 50)
                }
            }
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(isOn ? Color.green : Color.red)
            }
            Spacer()
            
            DescView()
        }
        .font(.title)
        .animation(.default, value: isOn)
    }
}

#Preview {
    StateWithModifiers()
}
