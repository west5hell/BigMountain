//
//  Published_Introduction.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct Published_Introduction: View {
    @StateObject private var vm = Published_IntroductionViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextEditor(text: $vm.data)
                .border(.gray, width: 1)
                .frame(height: 200)
                .padding()
            
            Text("\(vm.characterCount)/\(vm.characterLimit)")
                .foregroundStyle(vm.countColor)
        }
        .font(.title)
    }
}

#Preview {
    Published_Introduction()
}

class Published_IntroductionViewModel: ObservableObject {
    var characterLimit = 30
    @Published var data = ""
    @Published var characterCount = 0
    @Published var countColor = Color.gray

    init() {
        $data
            .map { data -> Int in
                return data.count
            }
            .assign(to: &$characterCount)

        $characterCount
            .map { [unowned self] count -> Color in
                let eightyPercent = Int(Double(characterLimit) * 0.8)
                if (eightyPercent...characterLimit).contains(count) {
                    return Color.yellow
                } else if count > characterLimit {
                    return Color.red
                }
                return Color.gray
            }
            .assign(to: &$countColor)
    }
}
