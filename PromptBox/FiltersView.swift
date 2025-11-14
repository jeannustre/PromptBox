//
//  QuestionView.swift
//  PromptBox
//
//  Created by Jean SARDA on 13/11/2025.
//

import SwiftUI

struct FiltersView: View {
    
    let filters: Filters
    
    var body: some View {
        VStack {
            difficulties
            sportTypes
            ratingRanges
            place
        }
    }
    
    var difficulties: some View {
        HStack {
            Text("Difficulties: ")
            ForEach(filters.difficulties ?? [], id: \.self) {
                Text($0.rawValue)
            }
        }
    }
    
    var sportTypes: some View {
        HStack {
            Text("Sport types: ")
            ForEach(filters.sportTypes ?? [], id: \.self) {
                Text($0.rawValue)
            }
        }
    }
    
    var ratingRanges: some View {
        HStack {
            Text("Rating ranges: ")
            Text(filters.ratings.rawValue)
        }
    }
    
    var place: some View {
        HStack {
            Text("Place: ")
            Text(filters.place)
        }
    }
}
