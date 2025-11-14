//
//  FilterSportType.swift
//  PromptBox
//
//  Created by Jean SARDA on 14/11/2025.
//

import FoundationModels

extension Filters {
 
    @Generable
    public enum FilterSportType: String, CaseIterable {
        case hiking = "HIKING"
        case hybridBike = "HYBRID_BIKE"
        case mountainBike = "MOUNTAIN_BIKE"
        case roadBike = "ROAD_BIKE"
        case gravelBike = "GRAVEL"
        case snowshoeing = "SNOWSHOEING"
        case other = "OTHER"
        
        case walkingAndShowshoeing = "WALKING_AND_SNOWSHOEING"
        case hybridAndGravelBike = "HYBRID_AND_GRAVEL_BIKE"
        case allCycling = "ALL_CYCLING"
    }
}
