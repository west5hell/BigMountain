//
//  Json_DatesView.swift
//  BigMountain
//
//  Created by Pongt Chia on 21/3/25.
//

import SwiftUI

struct Json_TodoList: Codable {
    var tasks: [Json_Task] = []
    
    struct Json_Task: Codable, Identifiable {
        var id = 0
        var description = ""
        var dueDate = Date()
    }
}

var jsonTodoData = """
{
    "tasks": [
        {
            "id": 1, "description": "Buy birthday present", "dueDate": "2024-06-24T19:00:57Z"
        }
    ]
}
"""

@Observable
class Json_DatesOO {
    var todoList = Json_TodoList()
    var jsonError: Error?
    
    func fetch() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let jsonData = jsonTodoData.data(using: .utf8)!
        
        do {
            todoList = try decoder.decode(Json_TodoList.self, from: jsonData)
        } catch {
            jsonError = error
        }
    }
}

struct Json_DatesView: View {
    @State private var oo = Json_DatesOO()
    
    var body: some View {
        VStack {
            HeaderView(
                "JSON",
                subtitle: "Dates",
                desc: "Dates can come in different formats. You can specify a date decoding strategy to help with this.",
                back: .blue,
                textColor: .white
            )
            
            List(oo.todoList.tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.description)
                    Text(task.dueDate.formatted())
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
            }
            Text(oo.jsonError?.localizedDescription ?? "")
        }
        .onAppear {
            oo.fetch()
        }
        .font(.title)
    }
}

#Preview {
    Json_DatesView()
}
