//
//  EmptyPublisher.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct EmptyPublisher: View {
    @StateObject private var vm = EmptyPublisherViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            List(vm.dataToView, id: \.self) { item in
                Text(item)
            }
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

#Preview {
    EmptyPublisher()
}

class EmptyPublisherViewModel: ObservableObject {
    @Published var dataToView: [String] = []
    
    func fetch() {
        let dataIn = ["Value 1", "Value 2", "Value 3", "🧨", "Value 5", "Value 6"]
        
        _ = dataIn.publisher
            .tryMap { item in
                if item == "🧨" {
                    throw BombDetectedError()
                }
                return item
            }
            .catch { error in
                Empty(completeImmediately: true)
            }
            .sink { [unowned self] item in
                dataToView.append(item)
            }
    }
    
    struct BombDetectedError: Error {
        
    }
}
