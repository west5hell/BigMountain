//
//  Json_CustomDecodingView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

var jsonHouseData = """
{
    "owner": "Emin Jacobsen",
    "address": {
        "street": "123 Main St",
        "city": "Sundsvall"
    }
}
"""

struct Json_HouseData: Decodable {
    var owner = ""
    var street = ""
    var city = ""
    
    enum CodingKeys: String, CodingKey {
        case owner, address
    }
    
    enum AddressKeys: String, CodingKey {
        case street, city
    }
    
    init() {}
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        owner = try container.decode(String.self, forKey: .owner)
        
        let address = try container.nestedContainer(keyedBy: AddressKeys.self, forKey: .address)
        
        street = try address.decode(String.self, forKey: .street)
        city = try address.decode(String.self, forKey: .city)
    }
}

@Observable
class Json_CustomDecodingOO {
    var houseData = Json_HouseData()
    var jsonError: Error?
    
    func fetch() {
        let jsonData = jsonHouseData.data(using: .utf8)!
        
        do {
            houseData = try JSONDecoder().decode(Json_HouseData.self, from: jsonData)
        } catch {
            jsonError = error
        }
    }
}

struct Json_CustomDecodingView: View {
    @State private var oo = Json_CustomDecodingOO()
    
    var body: some View {
        VStack {
            HeaderView(
                "JSON",
                subtitle: "Custom Decoding",
                desc: "Sometimes you don't want to create an object that matches the JSON. You can do your own custom decoding in this case.",
                back: .blue,
                textColor: .white
            )
            
            GroupBox("House Data") {
                Text(oo.houseData.owner)
                Text(oo.houseData.street)
                Text(oo.houseData.city)
            }
            .padding()
            
            Text(oo.jsonError?.localizedDescription ?? "")
        }
        .font(.title2)
        .onAppear {
            oo.fetch()
        }
    }
}

#Preview {
    Json_CustomDecodingView()
}
