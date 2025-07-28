//
//  UrlDataTaskPublisher.swift
//  BigMountain
//
//  Created by Pongt Chia on 28/7/25.
//

import Combine
import SwiftUI

struct CatFact: Decodable {
    let _id: String
    let text: String
}

class UrlDataTaskPublisherViewModel: ObservableObject {
    @Published var dataToView: [CatFact] = []
    var cancellables: Set<AnyCancellable> = []

    func fetch() {
        let url = URL(string: "https://cat-fact.herokuapp.com/facts")!
        URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, response) in
                data
            }
            .decode(type: [CatFact].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [unowned self] catFact in
                dataToView = catFact
            }
            .store(in: &cancellables)
    }
}

struct UrlDataTaskPublisherView: View {
    @StateObject private var vm = UrlDataTaskPublisherViewModel()

    var body: some View {
        VStack(spacing: 20) {
            List(vm.dataToView, id: \._id) { catFact in
                Text(catFact.text)
            }
            .font(.title3)
        }
        .font(.title)
        .onAppear {
            vm.fetch()
        }
    }
}

#Preview(body: {
    UrlDataTaskPublisherView()
})
