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
                vm.selection.send("Lorenzo")
            }
            
            Button("Select Ellen") {
                vm.selection.value = "Ellen"
            }
            
            Text(vm.selection.value)
                .foregroundStyle(vm.selectionSame.value ? .red : .green)
        }
        .font(.title)
    }
}

#Preview {
    CurrentValueSubjectView()
}

class CurrentValueSubjectViewModel: ObservableObject {
    var selection = CurrentValueSubject<String, Never>("No Name Selected")
    var selectionSame = CurrentValueSubject<Bool, Never>(false)
    var cancellables: [AnyCancellable] = []

    init() {
        selection
            .map { [unowned self] newValue -> Bool in
                if newValue == selection.value {
                    return true
                } else {
                    return false
                }
            }
            .sink { [unowned self] value in
                selectionSame.value = value
                objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
