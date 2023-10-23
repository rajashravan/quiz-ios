//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Raja Shravan on 2023-10-23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz:[Question] = [
        Question(text: "2 + 2 == 4?", answer: true),
        Question(text: "8 days in a week?", answer: false),
        Question(text: "sun bigger than earth?", answer: true),
    ]
    var questionNumber = 0
    
    mutating func markCurrentQuestion(userAnswer: Bool) -> Bool {
        let correctAnswer = self.quiz[questionNumber].answer
        self.incrementQuestionNumber()
        return userAnswer == correctAnswer
    }
    
    private mutating func incrementQuestionNumber() {
        self.questionNumber = (self.questionNumber + 1) % self.quiz.count
    }
    
    func currentQuestion() -> Question {
        return self.quiz[questionNumber]
    }
}
