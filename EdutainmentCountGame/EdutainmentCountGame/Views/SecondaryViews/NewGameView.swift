//
//  SettingsView.swift
//  EdutainmentCountGame
//
//  Created by Michael Novosad on 29.07.2021.
//

import SwiftUI
//Second screen. Should be shown after main screen.
class GameConditions: ObservableObject {
    @Published var questions: Int = 5
    @Published var stepper: Int = 1
}
struct NewGameView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var NewGameIsShown: Bool
    @Binding var game: Game
    @Binding var randomQuestion: String
    @StateObject var stepper: GameConditions
    @StateObject var questions: GameConditions
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background color")
                    .ignoresSafeArea(.all)
                Spacer()
                VStack(spacing: 50.0) {
                    VStack(alignment: .center) {
                        Text("Amount of questions:")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        ButtonText(text: "\(Int(questions.questions))")
                        HStack {
                            Button(action: {
                                self.questions.questions = 5
                            }, label: { ButtonText(text: "5")
                            })
                            Button(action: {
                                self.questions.questions = 10
                            }, label: { ButtonText(text: "10")})
                            
                            Button(action: {
                                self.questions.questions = 20
                            }, label: { ButtonText(text: "20")})
                            
                            Button(action: {
                                self.questions.questions = 144
                            }, label: { ButtonText(text: "All")})
                        }
                    }
                    VStack {
                        Text("Multiplication table:")
                            .padding(.top)
                            .foregroundColor(.white)
                        
                        HStack(alignment: .center) {
                            Spacer()
                            VStack {
                                ButtonText(text: "\(stepper.stepper)")
                                Stepper("Value:", value: $stepper.stepper, in: 1...12)
                            }
                            .padding(.top)
                            Spacer()
                        }
                        Text("\nUse stepper to choose your \nmultiplication table number")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all)
                    }
                    .padding(.bottom)
                    .navigationBarItems(trailing: Button("Done") {
                        UserDefaults.standard.setValue(questions.questions, forKey: "questions")
                        UserDefaults.standard.setValue(stepper.stepper, forKey: "stepper")
                        self.presentationMode.wrappedValue.dismiss()
                    })
                }
                .onDisappear() {
                    game.makeCollectionsEmpty()
                    game.restartGame(stepper: stepper.stepper)
                    randomQuestion = game.askNewQuestion()
                }
            }
        }
    }
}

struct NewGameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameView(NewGameIsShown: .constant(true), game: .constant(Game()), randomQuestion: .constant(" "), stepper: GameConditions(), questions: .init())
    }
}
