//
//  TextViews.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 29.07.2021.
//

import SwiftUI

struct AnswerField: View {
    
    @Binding var answerField: String
    
    var body: some View {
        TextField("Your answer...", text: $answerField)
            .foregroundColor(Color("Buttons text color"))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.white))
            .cornerRadius(30.0)
            .shadow(radius: 10, x: 5, y: 5)
            .keyboardType(.numberPad)
    }
}

struct ButtonText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .foregroundColor(Color("Buttons text color"))
            .scaledToFill()
            .padding()
            .frame(width: 90, height: 40)
            .background(Color("Button color"))
            .cornerRadius(30.0)
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct TextProperties: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.vertical)
            .foregroundColor(Color.white)
            .shadow(radius: 10, x: 5, y: 5)
        
    }
}

struct NewGameButtonStyle: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .foregroundColor(Color("Buttons text color"))
            .scaledToFill()
            .padding()
            .frame(width: 130, height: 40)
            .background(Color("Button color"))
            .cornerRadius(30.0)
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonText(text: ("5"))
            AnswerField(answerField: .constant("110"))
            TextProperties(text: "Your score: 0")
            NewGameButtonStyle(text: "New game")
            CheckYourAnswerStyle(text: "Check your answer")
        }
        .padding()
        .background(Color("Background color"))
    }
}
