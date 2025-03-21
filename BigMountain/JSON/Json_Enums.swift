//
//  Json_Enums.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

var jsonCarData = """
{
    "name": "Peugeot",
    "type": "foreign"
}
"""

enum CarType: String, Codable, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case unspecified
    case foreign
    case domestic
}

struct Json_Car: Codable {
    var name: String = ""
    var type: CarType = .unspecified
}

@Observable
class Json_EnumsOO {
    var carData = Json_Car()
    var jsonError: Error?
    
    func fetch() {
        let jsonData = jsonCarData.data(using: .utf8)!
        
        do {
            carData = try JSONDecoder().decode(Json_Car.self, from: jsonData)
        } catch {
            jsonError = error
        }
    }
}

struct Json_EnumsView: View {
    @State private var oo = Json_EnumsOO()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "JSON",
                subtitle: "Enums",
                desc: "Sometimes a field in JSON can only be a set number of values. In this case, you might want to decode that value into an enum.",
                back: .blue,
                textColor: .white
            )
            
            Text(oo.carData.name)
            
            Picker("Car Type", selection: $oo.carData.type) {
                ForEach(CarType.allCases) { type in
                    Text(type.rawValue.capitalized)
                        .tag(type)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Text(oo.carData.type.rawValue.capitalized)
            Text(oo.jsonError?.localizedDescription ?? "")
        }
        .onAppear {
            oo.fetch()
        }
        .font(.title)
    }
}

#Preview {
    Json_EnumsView()
}
