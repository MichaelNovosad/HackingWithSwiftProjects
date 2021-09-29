//
//  CorrectAnswerView.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 12.08.2021.
//

import SwiftUI

struct CorrectAnswerView: View {
    
    @Binding var randomQuestion: String
    @Binding var game: Game
    @Binding var answerField: String
    @Binding var countAppearanceTimes: Int
    
    var body: some View {
        HStack {
            if countAppearanceTimes >= 1 {
                CorrectAnswerStyle(text: "Correct answer for \(randomQuestion) is \(game.showCorrectAnswer(question: randomQuestion))!")
            }
        }
    }
}
struct CorrectAnswerStyle: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .foregroundColor(Color("Buttons text color"))
            .multilineTextAlignment(.center)
            .scaledToFill()
            .padding()
            .frame(maxWidth: 300, maxHeight: 60)
            .background(Color.white)
            .cornerRadius(30.0)
            .shadow(radius: 10, x: 5, y: 5)
    }
}
struct CorrectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectAnswerView(randomQuestion: .constant(""), game: .constant(Game()), answerField: .constant(""), countAppearanceTimes: .constant(1))
    }
}
