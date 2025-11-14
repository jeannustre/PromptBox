//
//  Filters.swift
//  PromptBox
//
//  Created by Jean SARDA on 13/11/2025.
//

import FoundationModels

@Generable
struct Filters {
    
    @Generable
    enum Difficulty: String {
        case easy, medium, hard
    }
    
    @Generable
    enum SportType: String {
        case hiking, cycling
    }
    
    @Generable
    enum RatingRange: String {
        case allRatings, above3, above4
    }
    
    @Guide(description: "The difficulty of the route. 'Difficult' or 'Hard' mean hard, 'Medium' means medium and 'Easy' means easy.")
    let difficulties: [Difficulty]?
    @Guide(description: "The place around which the search should take place. Can be a city name, location name, or around the user's location.")
    let place: String
    @Guide(description: "The sport type, either hiking or cycling.")
    let sportTypes: [SportType]?
    @Guide(description: "If no rating mentioned, defaults to allRatings")
    let ratings: RatingRange
}
