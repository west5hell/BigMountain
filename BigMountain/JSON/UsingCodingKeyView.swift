//
//  UsingCodingKeyView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

struct Json_Vegerable: Codable {
    var name = ""
    var color = ""
    var quantity = 0
    
    enum CodingKeys: String, CodingKey {
        case name = "01_vegatable_name"
        case color = "02_vegerable_color"
        case quantity
    }
}

var jsonVegerableData = """
{
    "01_vegatable_name": "Beans",
    "02_vegerable_color": "Yellow",
    "quantity": 10
}
"""

@Observable
class Json_UsingCodingKeyOO {
    var vegetable = Json_Vegerable()
    var jsonError: Error?
    
    func fetch() {
        let decoder = JSONDecoder()
        
        let jsonData = jsonVegerableData.data(using: .utf8)!
        
        do {
            vegetable = try decoder.decode(Json_Vegerable.self, from: jsonData)
        } catch {
            jsonError = error
        }
    }
}


struct Json_UsingCodingKeyView: View {
    @State private var oo = Json_UsingCodingKeyOO()
    
    var body: some View {
        VStack {
            HeaderView(
                "JSON",
                subtitle: "Using CodingKey",
                desc: "In some cases you get names in JSON that do not match up to your destination object at all. Use a CodingKeys enum to map them.",
                back: .blue,
                textColor: .white
            )
            
            Text("Name: \(oo.vegetable.name)")
            Text("Color: \(oo.vegetable.color)")
            Text("Quantity: \(oo.vegetable.quantity)")
            Text(oo.jsonError?.localizedDescription ?? "")
        }
        .onAppear {
            oo.fetch()
        }
        .font(.title)
    }
}

#Preview {
    Json_UsingCodingKeyView()
}
