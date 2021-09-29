//
//  GreetingsView.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 10.08.2021.
//

import SwiftUI
// Should be shown at the beginning of the game!
struct GreetingsView: View {
    
    @Binding var game: Game
    @StateObject var stepper: GameConditions
    @Binding var greetingsViewIsPresented: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background color")
                    .ignoresSafeArea(.all)
                VStack(alignment: .center) {
                    Text("Greetings!")
                    Text("""
                    You have started Edutainment Game!
                    Use this game to improve your multiplication skills.
                    If you are new to it, please choose "New Game" next.
                    You just need to select multiplication table and how many
                    questions should be asked!
                    Be open to experiments and have fun!
                    """)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        greetingsViewIsPresented = false
                        game.startGame(stepper: stepper.stepper)
                    }, label: {
                        CheckYourAnswerStyle(text: "Continue")
                    })
                }
                    .padding(.all)
                    .frame(maxWidth: 300)
                    .background(Color.white)
                    .cornerRadius(25.0)
                    .shadow(radius: 10, x: 5, y: 5)
                    .transition(.scale)
            }
            Spacer()
        }
    }
}

struct GreetingsView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingsView(game: .constant(Game()), stepper: GameConditions(), greetingsViewIsPresented: .constant(true))
    }
}
