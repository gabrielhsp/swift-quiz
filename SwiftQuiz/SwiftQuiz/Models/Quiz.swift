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
    
    /** Desconstructor method that print a message when an object of Quiz type is cleared from memory */
    deinit {
        print("Liberou o quiz da memória")
    }
    
    /** Valide if the option choosed by the user it's the correct answer returning a Bool value */
    func validateOption(_ index: Int) -> Bool {
        let answer = options[index]
        
        return answer == correctedAnswer
    }
}
