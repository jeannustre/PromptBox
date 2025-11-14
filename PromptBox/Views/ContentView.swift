//
//  ContentView.swift
//  PromptBox
//
//  Created by Jean SARDA on 13/11/2025.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    
    @State private var session = LanguageModelSession(instructions: "You are a search bar helping users find hikes. You can filter hikes by location, difficulty, duration, etc." /* When the users's query doesn't include an information, be the most inclusive you can about the field."*/)
    
    @State private var query: String = ""
    
    @State private var filters: Filters?
    
    @State private var thinking: Bool = false
    
    let suggestions: [String] = [
        "Difficult cycling route near Grenoble",
        "Easy snowshoeing loop near Bolquère",
        "Cycling",
        "Hikes near me",
        "A looping cycling route near Lyon",
        "Easy walk with my dog",
        "Hiking in the Alps"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                inputView
                Divider()
                suggestionsView
                if thinking {
                    ProgressView()
                    Text("Thinking...")
                } else if let filters {
                    FiltersView(query: query, filters: filters)
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    func generateFilters(query: String) async throws -> Filters {
        let response = try await session.respond(to: "Generate a Filters object from a search bar input for hikes or cycle rides. Don't fill fields the user query doesn't explicitly mention. The user query is : '\(query)'", generating: Filters.self)
        return response.content
    }
    
    var inputView: some View {
        VStack {
            Text("Enter your query below :")
                .padding(.top, 24)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("A difficult snowshoeing route", text: $query)
                .modifier(TextFieldClearButton(text: $query))
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: .infinity)
            generateButton
        }
    }
    
    var suggestionsView: some View {
        VStack {
            Text("Or try one of these suggestions :")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(suggestions, id: \.self) { suggestion in
                Button(action: {
                    query = suggestion
                    think()
                }, label: {
                    Text(suggestion)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
            }
        }
        .padding(.top, 24)
    }
    
    var generateButton: some View {
        Button(action: {
            think()
        }, label: {
            Text("Generate")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .tint(Color.blue)
    }
    
    func think() {
        Task {
            thinking = true
            filters = nil
            filters = try await generateFilters(query: query)
            thinking = false
        }
    }
}

#Preview {
    ContentView()
}
