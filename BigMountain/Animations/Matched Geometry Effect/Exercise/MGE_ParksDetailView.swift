//
//  MGE_ParksDetailView.swift
//  BigMountain
//
//  Created by Pongt Chia on 26/4/25.
//

import SwiftUI

struct MGE_ParksDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedPark: ExerciseItem?
    var park: ExerciseItem
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            
            GeometryReader { gp in
                Image(park.imageName)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.4)
                    .blur(radius: 30)
                    .ignoresSafeArea()
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(park.name)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: park.isFavorite ? "bookmark.fill" : "bookmark")
                                .foregroundStyle(.white)
                                .padding(12)
                                .background {
                                    Circle()
                                }
                        }
                        .shadow(radius: 10, y: 15)
                        .offset(x: show ? 0 : 60)
                        .animation(.easeOut.delay(0.4), value: show)
                    }
                    .padding(.trailing)
                    
                    Image(park.imageName)
                        .resizable()
                        .scaledToFill()
                    
                    Group {
                        HStack {
                            Text(park.location)
                                .font(.title3)
                                .italic()
                                .bold()
                                .opacity(0.5)
                            
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "map")
                                    .foregroundStyle(.white)
                                    .padding(12)
                                    .background {
                                        Circle()
                                    }
                            }
                            .shadow(radius: 10, y: 15)
                        }
                        
                        Text(park.details)
                            .padding(.bottom)
                        
                        Button {
                            selectedPark = nil
                            show = false
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .font(.title)
                                .padding()
                                .background {
                                    Circle()
                                }
                        }
                        .shadow(radius: 10, y: 15)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    .offset(y: show ? 0 : 20)
                    .opacity(show ? 1 : 0)
                    .animation(.easeOut.delay(0.4), value: show)
                }
            }
        }
        .onAppear(perform: {
            show.toggle()
        })
        .tint(Color("Gold"))
    }
}

#Preview {
    @Previewable @Namespace var ns
    @Previewable @State var selectedPark: ExerciseItem? = ExerciseItem(name: "Zion", imageName: "Zion", details: "Zion National Park is a southwest Utah nature preserve distinguished by Zion Canyon’s steep red cliffs. Zion Canyon Scenic Drive cuts through its main section, leading to forest trails along the Virgin River. The river flows to the Emerald Pools, which have waterfalls and a hanging garden. Also along the river, partly through deep chasms, is Zion Narrows wading hike.", location: "Springdale, UT")
    
    MGE_ParksDetailView(namespace: ns, selectedPark: $selectedPark, park: selectedPark!)
}
