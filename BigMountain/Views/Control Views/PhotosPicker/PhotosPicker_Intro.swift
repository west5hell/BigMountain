//
//  PhotosPicker_Intro.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI
import PhotosUI

struct PhotosPicker_Intro: View {
    @State private var photo: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $photo, matching: .images) {
                Text("Select a photo")
            }
            Spacer()
            if let selectedImage {
                Text("Selected Photo")
                selectedImage
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
        }
        .font(.title)
        .onChange(of: photo) { oldValue, newValue in
            if let newValue {
                Task {
                    selectedImage = await newValue.convert()
                }
            }
        }
    }
}

#Preview {
    PhotosPicker_Intro()
}


extension PhotosPickerItem {
    @MainActor
    func convert() async -> Image {
        do {
            if let image = try await self.loadTransferable(type: Image.self) {
                return image
            }
        } catch {
            print(error.localizedDescription)
        }
        return Image(systemName: "xmark.octagon")
    }
}
