//
//  Questions.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 09.08.2021.
//

import Foundation

struct Questions {
    
    var allQuestions: [String] = []
    var allAnswers: [Int] = []
    var questionsAccordingToStepper: [String] = []
    
    mutating func renderAllQuestions() {
        for i in 1...12 {
            for j in 1...12 {
                allQuestions.append("\(i) * \(j)")
            }
        }
    }
    
    mutating func renderAllAnswers() {
        for i in 1...12 {
            for j in 1...12 {
                allAnswers.append(i * j)
            }
        }
    }
    
    mutating func renderSpecificQuestionsWithStepper(stepperValue stepper: Int) {
        for i in 1...12 {
            questionsAccordingToStepper.append("\(i) * \(stepper)")
        }
    }
}
