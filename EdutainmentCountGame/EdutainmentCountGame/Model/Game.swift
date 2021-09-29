//
//  Game.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 29.07.2021.
//

import Foundation
import SwiftUI

struct Game {

    lazy var questions = Questions()
    var score = 0
    
    mutating func askNewQuestion() -> String {
        questions.questionsAccordingToStepper.randomElement() ?? "Error!"
    }
    
    mutating func countScoreResult(yourAnswer answer: String, usersQuestion question: String) {
        for key in questions.allQuestions.indices where questions.allQuestions[key] == question {
            if questions.allAnswers[key] == Int(answer) {
                score += 1
            } else {
                score -= 1
            }
        }
    }
    
    mutating func makeCollectionsEmpty() {
        questions.allAnswers = []
        questions.allQuestions = []
        questions.questionsAccordingToStepper = []
    }
    
    mutating func startGame(stepper: Int) {
        questions.renderAllQuestions();
        questions.renderAllAnswers();
        questions.renderSpecificQuestionsWithStepper(stepperValue: stepper)
    }
    
    mutating func restartGame(stepper: Int) {
        startGame(stepper: stepper)
        score = 0
    }
    
    func changeDisabledStateForCheckYourAnswerView(answer: String) -> Bool {
        var disabledState: Bool
        if answer == "" {
            disabledState = true
        } else {
            disabledState = false
        }
        return disabledState
    }
    
    mutating func showCorrectAnswer(question: String) -> Int {
        var countAnswer = 0
        for key in questions.allQuestions.indices where questions.allQuestions[key] == question {
                countAnswer = questions.allAnswers[key]
                return Int(countAnswer)
            }
        return countAnswer
    }
    mutating func showGameOverResultScreen(questionsAsked: Int, questionsAmount: Int) -> Bool {
        var gameOverView = false
        if questionsAmount == 5 && questionsAsked == 5 {
            gameOverView = true
        }
        if questionsAmount == 10 && questionsAsked == 10 {
            gameOverView = true
        }
        if questionsAmount == 20 && questionsAsked == 20 {
            gameOverView = true
        }
        if questionsAmount == 144 && questionsAsked == 144 {
            gameOverView = true
        }
        return gameOverView
    }
    
}

