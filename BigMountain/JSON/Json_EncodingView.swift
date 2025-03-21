//
//  Json_EncodingView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

@Observable
class Json_EncodingOO {
    var user = Json_User()
    var formattedJson = ""
    var jsonError: Error?
    
    func fetch() {
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        do {
            user = try decoder.decode(Json_User.self, from: jsonData)
        } catch {
            jsonError = error
        }
    }
    
    func save() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(user)
            formattedJson = String(data: jsonData, encoding: .utf8)!
        } catch {
            jsonError = error
        }
    }
}

struct Json_EncodingView: View {
    @State private var oo = Json_EncodingOO()
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(
                "JSON",
                subtitle: "Encoding",
                desc: "JSON encoding is the process of taking a struct or class and converting it to JSON data.",
                back: .blue,
                textColor: .white
            )
            
            Button("Save to JSON") {
                oo.save()
            }
            .buttonStyle(.borderedProminent)
            
            Text(oo.formattedJson)
                .font(.system(.title, design: .monospaced))
            
            Spacer()
            
            Text(oo.jsonError?.localizedDescription ?? "")
        }
        .onAppear {
            oo.fetch()
        }
        .font(.title)
    }
}

#Preview {
    Json_EncodingView()
}
