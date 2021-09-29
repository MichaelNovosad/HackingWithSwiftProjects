//
//  ContentView.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var questions: GameConditions
    @StateObject var stepper: GameConditions
    @State var game: Game
    
    @State private var greetingsViewIsPresented = false
    @State private var scoreAlertIsPresented = false
    @State private var newGameIsShown = false
    @State private var gameOverViewIsPresented = false
    @State private var selection: String? = nil
    @State private var answerField = ""
    @State private var randomQuestion = ""
    @State private var countOnAppearWork = 0
    @State private var countQuestionsAsked = 0
    @State private var countAppearanceTimes = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background color")
                    .ignoresSafeArea(.all)
                VStack(alignment: .center) {
                    Spacer()
                    // if - else changes appearance of first view from greetings to ContentView
                    if greetingsViewIsPresented {
                        GreetingsView(game: $game, stepper: GameConditions(), greetingsViewIsPresented: $greetingsViewIsPresented)
                    } else {
                        if randomQuestion == "" {
                            TextProperties(text: "Please, choose your multiplication value!")
                        } else {
                            TextProperties(text:("What is..."))
                            TextProperties(text: randomQuestion)
                        }
                        VStack(alignment: .center) {
                            TextProperties(text:("Put your answer below:"))
                            AnswerField(answerField: $answerField)
                                .keyboardType(.numberPad)
                        }
                        HStack {
                            ButtonView(questions: GameConditions(), game: $game, answerField: $answerField, randomQuestion: $randomQuestion, scoreAlertIsPresented: $scoreAlertIsPresented, countAppearanceTimes: $countAppearanceTimes)
                          .alert(isPresented: $scoreAlertIsPresented, content: {
                            return Alert(title: Text("Score"), message: Text("Your score is \(game.score)!"), dismissButton: .default(Text("Continue")))
                            })
                            NextQuestionView(questions: GameConditions(), game: $game, answerField: $answerField, randomQuestion: $randomQuestion, countQuestionsAsked: $countQuestionsAsked, gameOverViewIsPresented: $gameOverViewIsPresented, countAppearanceTimes: $countAppearanceTimes)
                                .alert(isPresented: $gameOverViewIsPresented, content: {
                                    return Alert(title: Text("Game Over"), message: Text("Your final score is \(game.score)!"), dismissButton: .default(Text("New Game"))
                                    {
                                        game.restartGame(stepper: stepper.stepper)
                                        countQuestionsAsked = 0
                                    })
                                })
                        }
                        CorrectAnswerView(randomQuestion: $randomQuestion, game: $game, answerField: $answerField, countAppearanceTimes: $countAppearanceTimes)
                        Spacer()
                        HStack(alignment: .center, spacing: 10) {
                            NavigationLink(
                                destination: NewGameView(NewGameIsShown: $newGameIsShown, game: $game, randomQuestion: $randomQuestion, stepper: stepper, questions: questions),
                                tag: "New game",
                                selection: $selection,
                                label: {
                                    Button(action: {
                                        self.selection = "New game"
                                    }, label: {
                                        NewGameButtonStyle(text: "New game")
                                    })
                                })
                        }
                    }
                }
                .padding(.all)
            }
        }
        .onAppear() {
            if countOnAppearWork == 0 {
                greetingsViewIsPresented = true
            } else if countOnAppearWork >= 1 {
                greetingsViewIsPresented = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(questions: GameConditions(), stepper: GameConditions(), game: Game())
    }
}
