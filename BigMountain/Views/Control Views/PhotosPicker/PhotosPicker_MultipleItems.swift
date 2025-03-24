//
//  PhotosPicker_MultipleItems.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/3/25.
//

import SwiftUI
import PhotosUI

struct PhotosPicker_MultipleItems: View {
    @State private var photos: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $photos, matching: .images) {
                Text("Photos")
            }
            
            if (photos.count > 0) {
                Text("Selected Photos")
                List {
                    ForEach(0..<selectedImages.count, id: \.self) { index in
                        selectedImages[index]
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            Spacer()
        }
        .font(.title)
        .onChange(of: photos) { oldValue, newValue in
            Task {
                for newPhoto in newValue {
                    await selectedImages.append(newPhoto.convert())
                }
            }
        }
    }
}

#Preview {
    PhotosPicker_MultipleItems()
}
