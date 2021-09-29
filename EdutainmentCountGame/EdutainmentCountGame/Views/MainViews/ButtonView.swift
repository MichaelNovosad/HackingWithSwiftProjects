//
//  ButtonView.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 09.08.2021.
//

import SwiftUI


struct ButtonView: View {

    @StateObject var questions: GameConditions
    @Binding var game: Game
    @Binding var answerField: String
    @Binding var randomQuestion: String
    @Binding var scoreAlertIsPresented: Bool
    @Binding var countAppearanceTimes: Int

    var body: some View {
        Button(action: {
            game.countScoreResult(yourAnswer: answerField, usersQuestion: randomQuestion)
            scoreAlertIsPresented = true
            countAppearanceTimes += 1
        }, label: {
            CheckYourAnswerStyle(text: "Check your answer")
        })
        .disabled(game.changeDisabledStateForCheckYourAnswerView(answer: answerField))
    }
}

struct CheckYourAnswerStyle: View {
    
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

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckYourAnswerStyle(text: "Check your answer")
    }
}
