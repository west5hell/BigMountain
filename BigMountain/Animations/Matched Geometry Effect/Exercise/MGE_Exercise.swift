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
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(parks) { park in
                        ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                    }
                } header: {
                    ParksSectionHeaderView()
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .overlay {
            if let selectedPark {
                MGE_ParksDetailView(namespace: namespace, selectedPark: $selectedPark, park: selectedPark)
            }
        }
    }
}

#Preview {
    MGE_Exercise()
}

struct ParksRowView: View {
    var namespace: Namespace.ID
    @Binding var selectedPark: ExerciseItem?
    var park: ExerciseItem
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if park.id != selectedPark?.id {
                Image(park.imageName)
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .matchedGeometryEffect(id: park.id, in: namespace)
                
                Text(park.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .matchedGeometryEffect(id: "\(park.id)name", in: namespace, properties: .position)
                    .zIndex(1)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        Color(UIColor.systemBackground).opacity(0.4)
                    }
            } else {
                Image(park.imageName)
                    .resizable()
                    .scaledToFill()
                    .hidden()
            }
        }
        .padding(.horizontal, 12)
        .onTapGesture {
            withAnimation(.easeOut) {
                selectedPark = park
            }
        }
    }
}

struct ParksSectionHeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemBackground)
                .opacity(0.8)
            
            Text("UTAH NATIONAL PARKS")
                .font(.title)
                .fontWeight(.black)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .frame(height: 100)
    }
}
