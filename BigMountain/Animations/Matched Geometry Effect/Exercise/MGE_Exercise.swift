//
//  MGE_Exercise.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_Exercise: View {
    @Namespace var namespace
    @State private var selectedPark: ExerciseItem?
    @State private var parks = ExerciseData.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(parks) { park in
                    ZStack(alignment: .bottom) {
                        Image(park.imageName)
                            .resizable()
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        
                        Text(park.name)
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background {
                                Color(UIColor.systemBackground).opacity(0.4)
                            }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    MGE_Exercise()
}
