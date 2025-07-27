//
//  CurrentValueSubject.swift
//  BigMountain
//
//  Created by Pongt Chia on 27/7/25.
//

import Combine
import SwiftUI

struct CurrentValueSubjectView: View {
    @StateObject private var vm = CurrentValueSubjectViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Select Lorenzo") {
//                vm.selection.send("Lorenzo")
                vm.selection = "Lorenzo"
            }
            
            Button("Select Ellen") {
//                vm.selection.value = "Ellen"
                vm.selection = "Ellen"
            }
            
//            Text(vm.selection.value)
            Text(vm.selection)
                .foregroundStyle(vm.selectionSame.value ? .red : .green)
        }
        .font(.title)
    }
}

#Preview {
    CurrentValueSubjectView()
}

class CurrentValueSubjectViewModel: ObservableObject {
//    var selection = CurrentValueSubject<String, Never>("No Name Selected")
    @Published var selection = "No Same Selected"
    var selectionSame = CurrentValueSubject<Bool, Never>(false)
    var cancellables: [AnyCancellable] = []

    init() {
//        selection
        $selection
            .map { [unowned self] newValue -> Bool in
//                if newValue == selection.value {
//                    return true
//                } else {
//                    return false
//                }
                newValue == selection
            }
            .sink { [unowned self] value in
                selectionSame.value = value
                objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
