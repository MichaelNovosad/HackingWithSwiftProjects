//
//  GreetingsView.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 10.08.2021.
//

import SwiftUI
// Should be shown at the beginning of the game!
struct GameOverView: View {
    
    @Binding var game: Game
    @StateObject var stepper: GameConditions
    @Binding var gameOverViewIsPresented: Bool
    
    var body: some View {
        if gameOverViewIsPresented {
            VStack(alignment: .center) {
                Text("Game Over!")
                Text("""
                    You are out of questions!
                    Final score is \(game.score)
                    """)
                    .multilineTextAlignment(.center)
                Button(action: {
                    gameOverViewIsPresented = false
                    game.restartGame(stepper: stepper.stepper)
                }, label: {
                    CheckYourAnswerStyle(text: "Restart")
                })
            }
            .padding(.all)
            .frame(maxWidth: 300)
            .background(Color.white)
            .cornerRadius(25.0)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(game: .constant(Game()), stepper: GameConditions(), gameOverViewIsPresented: .constant(true))
    }
}
