//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Gabriel Henrique Santos Pereira on 25/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import Foundation

class Quiz {
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options: [String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    deinit {
        print("Liberou o quiz da memória")
    }
    
    func validateOption(_ index: Int) -> Bool {
        let answer = options[index]
        
        return answer == correctedAnswer
    }
}
