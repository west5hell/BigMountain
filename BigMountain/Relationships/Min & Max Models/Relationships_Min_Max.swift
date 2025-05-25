//
//  Relationships_Min_Max.swift
//  BigMountain
//
//  Created by Pongt Chia on 25/5/25.
//

import SwiftUI
import SwiftData

struct Relationships_Min_Max: View {
    @Query private var owners: [ContestantModel]
    @State private var showAddContestant = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Contestants") {
                    ForEach(owners) { owner in
                        VStack(alignment: .leading) {
                            Text(owner.name)
                                .font(.title2)
                            ForEach(owner.entries) { entry in
                                Label(entry.productName, systemImage: "paintbrush.pointed.fill")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .headerProminence(.increased)
            .navigationTitle("Crafts Contest")
            .toolbar {
                Button("", systemImage: "plus") {
                    showAddContestant.toggle()
                }
            }
            .sheet(isPresented: $showAddContestant) {
                AddNewContestantView()
            }
        }
    }
}

#Preview {
    Relationships_Min_Max()
        .modelContainer(ContestantModel.preview)
}

struct AddNewContestantView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var products = Array(repeating: "", count: 3)
    @State private var message = ""
    
    var body: some View {
        Form {
            Section {
                TextField("contestant name", text: $name)
                ForEach(0..<3) { index in
                    TextField("product name", text: $products[index])
                }
            } header: {
                Text("New Contestant")
                    .padding(.top)
            }
            
            if !message.isEmpty {
                Text(message)
                    .foregroundStyle(.red)
            }

            Button {
                message = ""
                
                if name.isEmpty {
                    message = "Please enter the contestant's name"
                    return
                }
                
                let contestant = ContestantModel(name: name)
                modelContext.insert(contestant)
                
                for product in products where !products.isEmpty {
                    contestant.entries.append(ContestEntryModel(productName: product))
                }
                
                do {
                    try modelContext.save()
                } catch {
                    message = error.localizedDescription
                    
                    if error.localizedDescription.lowercased().contains("too few") {
                        message = "Need at least one product"
                    } else if  error.localizedDescription.lowercased().contains("too many") {
                        message = "You can only have a maximum of 2 products"
                    }
                    
                    modelContext.rollback()
                    return
                }
                
                dismiss()
            } label: {
                Text("Add")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
            }
            .listRowBackground(Color.accentColor)
        }
        .headerProminence(.increased)
    }
}
