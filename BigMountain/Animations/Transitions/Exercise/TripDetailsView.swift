//
//  TripDetailsView.swift
//  BigMountain
//
//  Created by Pongt Chia on 23/4/25.
//

import SwiftUI

struct TripDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Destination:")
                .foregroundStyle(Color("Foreground3"))
            Button {
                
            } label: {
                Text("Select")
                Spacer()
                Image(systemName: "chevron.right")
            }
            
            Text("Departure:")
                .foregroundStyle(Color("Foreground3"))
                .padding(.top)
            Button {
                
            } label: {
                Text("Today")
                Spacer()
                Image(systemName: "chevron.right")
            }
            
            Text("Return:")
                .foregroundStyle(Color("Foreground3"))
                .padding(.top)
            Button {
                
            } label: {
                Text("Tomorrow")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .padding(25)
        .background(RoundedRectangle(cornerRadius: 10))
//        .foregroundStyle(Color("Secondary3"))
        .padding(40)
        .font(.body)
    }
}

#Preview {
    TripDetailsView()
}
