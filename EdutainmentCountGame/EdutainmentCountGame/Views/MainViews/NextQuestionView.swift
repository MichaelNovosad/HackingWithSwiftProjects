//
//  NextQuestionView.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 12.08.2021.
//

import SwiftUI

struct NextQuestionView: View {

        @StateObject var questions: GameConditions
        @Binding var game: Game
        @Binding var answerField: String
        @Binding var randomQuestion: String
        @Binding var countQuestionsAsked: Int
        @Binding var gameOverViewIsPresented: Bool
        @Binding var countAppearanceTimes: Int

        var body: some View {
            Button(action: {
                randomQuestion = game.askNewQuestion()
                answerField = ""
                countQuestionsAsked += 1
                countAppearanceTimes = 0
                gameOverViewIsPresented = game.showGameOverResultScreen(questionsAsked: countQuestionsAsked, questionsAmount: questions.questions)
            }, label: {
                CheckYourAnswerStyle(text: "Next Question")
            })
        }
    }

    struct NextQuestionViewStyle: View {
        
        var text: String
        
        var body: some View {
            Text(text)
                .font(.body)
                .bold()
                .foregroundColor(Color("Buttons text color"))
                .scaledToFill()
                .padding()
                .frame(width: 190, height: 40)
                .background(Color("Button color"))
                .cornerRadius(30.0)
                .shadow(radius: 10, x: 5, y: 5)
        }
    }

struct NextQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        NextQuestionView(questions: GameConditions(), game: .constant(Game()), answerField: .constant(""), randomQuestion: .constant(""), countQuestionsAsked: .constant(0), gameOverViewIsPresented: .constant(true), countAppearanceTimes: .constant(1))
    }
}
