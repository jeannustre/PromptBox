//
//  Question.swift
//  PromptBox
//
//  Created by Jean SARDA on 13/11/2025.
//

import FoundationModels

@Generable
struct Question {
    @Guide(description: "The quiz question")
    let text: String
    @Guide(.count(4))
    let choices: [String]
    let answer: String
    @Guide(description: "A brief explanation of why the answer is correct.")
    let explanation: String
}
