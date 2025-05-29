//
//  PhotosUIView.swift
//  BigMountain
//
//  Created by Pongt Chia on 29/5/25.
//

import PhotosUI
import SwiftData
import SwiftUI

struct PhotosUIView: View {
    @Query private var properties: [PropertyModel]

    var body: some View {
        NavigationStack {
            List(properties) { property in
                NavigationLink {
                    PropertyDetailView(property: property)
                } label: {
                    VStack {
                        Image(uiImage: property.viewImage)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 16))
                        Text(property.name)
                            .font(.title.weight(.medium).width(.condensed))
                        Text(property.address)
                            .foregroundStyle(.secondary)
                    }
                }
                .listRowSeparator(.hidden)

            }
            .listStyle(.plain)
            .navigationTitle("Properties")
        }
    }
}

#Preview {
    PhotosUIView()
        .modelContainer(PropertyModel.preview)
}

struct PropertyDetailView: View {
    var property: PropertyModel
    @State private var selectedPhoto: PhotosPickerItem?

    var body: some View {
        VStack {
            PhotosPicker(
                "Select Image",
                selection: $selectedPhoto,
                matching: .images,
                photoLibrary: .shared()
            )
            .buttonStyle(.borderedProminent)
            .padding()

            Image(uiImage: property.viewImage)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 16))
            Text(property.name)
                .font(.title.weight(.medium).width(.condensed))
            Text(property.address)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
        .task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(
                type: Data.self
            ) {
                property.image = data
            }
        }
        .navigationTitle("Property Details")
    }
}
