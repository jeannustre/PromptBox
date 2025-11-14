//
//  ContentView.swift
//  PromptBox
//
//  Created by Jean SARDA on 13/11/2025.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
    
    @State private var session = LanguageModelSession(instructions: "You are a search bar helping users find hikes. You can filter hikes by location, difficulty, or duration.")
    
    @State private var query: String = ""
    
    @State private var filters: Filters?
    
    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Enter your query here", text: $query)
                .padding()
                .frame(maxWidth: .infinity)
            Spacer()
            if let filters {
                FiltersView(filters: filters)
            }
            Spacer()
            Button("Generate", action: {
                Task {
                    filters = nil
                    filters = try await generateFilters(query: query)
                }
                
            })
            .padding()
            .frame(maxWidth: .infinity)

        }
        .padding(.horizontal)
    }
    
    func generateFilters(query: String) async throws -> Filters {
        let response = try await session.respond(to: "Create a Filters object which will be applied to a users search for hikes. The user query is : \(query)", generating: Filters.self)
        return response.content
    }
    
}

#Preview {
    ContentView()
}
