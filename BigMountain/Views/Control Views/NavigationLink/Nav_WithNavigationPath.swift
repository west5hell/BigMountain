//
//  Nav_WithNavigationPath.swift
//  BigMountain
//
//  Created by Pongt Chia on 24/3/25.
//

import SwiftUI

struct ProductForNav: Hashable {
    var name = ""
    var price = 0.0
}

struct CreditCardForNav: Hashable {
    var number = ""
    var expiration = ""
}

struct Nav_WithNavigationPath: View {
    @State private var product = ProductForNav(name: "Mouse", price: 24.99)
    @State private var cc = CreditCardForNav(number: "5111 1111 1111 1111", expiration: "02/28")
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            Form {
                NavigationLink(value: product) {
                    Text(product.name)
                }
                NavigationLink(value: cc) {
                    Text(cc.number)
                }
            }
            .navigationTitle("Order")
            .navigationDestination(for: ProductForNav.self) { product in
                Form {
                    Text(product.name)
                    Text(product.price, format: .currency(code: "USD"))
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Product Details")
            }
            .navigationDestination(for: CreditCardForNav.self) { cc in
                Form {
                    Text(cc.number)
                    Text(cc.expiration)
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Credit Card Details")
            }
        }
        .font(.title)
    }
}

#Preview {
    Nav_WithNavigationPath()
}
