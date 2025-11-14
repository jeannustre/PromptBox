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
    enum RatingRange: String {
        case allRatings, above3, above4
    }
    
    @Generable
    enum Location  {
        case nearMe
        case currentScreen
        case specificPlace(place: String)
        
        var description: String {
            switch self {
            case .nearMe:
                "nearMe"
            case .currentScreen:
                "currentScreen"
            case .specificPlace(let place):
                "specificPlace: \(place)"
            }
        }
    }

    @Guide(description: "The possible sports mentioned in the query.")
    let sportTypes: [FilterSportType]
    
    @Guide(description: "The allowed difficulties of the route, or none to include all routes.", .count(0...3))
    let difficulties: [Difficulty]
    
    @Guide(description: "Only true if the query mentions terms like 'popular' or 'well rated'")
    let popular: Bool
    
    @Guide(description: "Whether the query mentions the hike/balad must be a loop.")
    let specifiesLooping: Bool
    
    @Guide(description: "Whether the query mentions a place or a location.")
    let specifiesLocation: Bool
    
    @Guide(description: "If there is no  location mentioned in the query, must be `currentScreen`. If the location is related to the user position, must be `nearMe`. If a specific place is mentioned, use `specificPlace`.")
    let location: Location
    
    @Guide(description: "Explicit requirements the route must have. Must be explictly stated in the query. Can be empty.", .minimumCount(0))
    let requirements: [String]
}
