//
//  QuestionView.swift
//  PromptBox
//
//  Created by Jean SARDA on 13/11/2025.
//

import SwiftUI

struct FiltersView: View {
    
    let query: String
    let filters: Filters
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("'\(query)'")
                .font(.title.italic())
            FilterView(title: "Difficulties: ", values: filters.difficulties.map(\.rawValue))
            FilterView(title: "Sport types: ", values: filters.sportTypes.map(\.rawValue))
            FilterView(title: "Specifies location: ", values: [filters.specifiesLocation ? "yes" : "no"])
            FilterView(title: "Specified location: ", values: [filters.location.description])
            FilterView(title: "Specifies looping: ", values: [filters.specifiesLooping ? "yes" : "no"])
            FilterView(title: "Popular: ", values: [filters.popular
                                                    ? "yes" : "no"])
            FilterView(title: "Requirements: ", values: filters.requirements)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(8)
        .frame(maxWidth: .infinity)
    }
}

struct FilterView: View {
    
    @State var title: String
    @State var values: [String]
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.body.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            ForEach(values, id: \.self) {
                Text($0)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
    }
}
