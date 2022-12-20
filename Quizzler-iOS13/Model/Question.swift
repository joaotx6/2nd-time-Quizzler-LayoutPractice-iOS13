//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Joao Teixeira on 15/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    let answer: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.rightAnswer = correctAnswer
    }
}


