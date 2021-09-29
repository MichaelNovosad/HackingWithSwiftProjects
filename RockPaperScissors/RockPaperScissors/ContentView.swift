//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Michael Novosad on 26.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var threeMoves = ["Rock", "Paper", "Scissors"]
    @State private var cpuCurrentChoice = Int.random(in: 0...2)
    @State private var playerHasWon = Bool.random()
    @State private var playersScore = 0
    @State private var endGameAlertPopUp = false
    @State private var questionsCount = 0
    
    var playersWinText: String {
        if playerHasWon == true {
            return "win"
        } else {
            return "lose"
        }
    }
    
    func paperGameConditions() {
        
        if threeMoves[cpuCurrentChoice] == "Rock" && playerHasWon == true {
            playersScore += 1
        } else if threeMoves[cpuCurrentChoice] == "Scissors" && playerHasWon == false {
            playersScore += 1
        } else {
            playersScore -= 1
        }
        continueTheGame()
        
    }
    func scissorsGameConditions() {
        
        if threeMoves[cpuCurrentChoice] == "Paper" && playerHasWon == true {
            playersScore += 1
        } else if threeMoves[cpuCurrentChoice] == "Rock" && playerHasWon == false {
            playersScore += 1
        } else {
            playersScore -= 1
        }
        continueTheGame()
    }
    
    func rockGameConditions() {
        
        if threeMoves[cpuCurrentChoice] == "Scissors" && playerHasWon == true {
            playersScore += 1
        } else if threeMoves[cpuCurrentChoice] == "Paper" && playerHasWon == false {
            playersScore += 1
        } else {
            playersScore -= 1
        }
        continueTheGame()
    }
    
    func continueTheGame() {
        threeMoves.shuffle()
        cpuCurrentChoice = Int.random(in: 0...2)
        playerHasWon = Bool.random()
        questionsCount += 1
        if questionsCount == 10 {
            endGameAlertPopUp = true
        }
    }
    
    func startNewGame() {
        playersScore = 0
        questionsCount = 0
        continueTheGame()
        if questionsCount == 10 {
            endGameAlertPopUp = true
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack (spacing: 20) {
                VStack(alignment: .leading) {
                    Text("If CPU move is: \(threeMoves[cpuCurrentChoice])")
                    Text("and you should \(playersWinText)")
                }
                VStack (spacing: 10) {
                    Text("Your choice will be:")
                    HStack (spacing: 30){
                        Button("Rock", action: { rockGameConditions() })
                        Button("Paper", action: { paperGameConditions() })
                        Button("Scissors", action: { scissorsGameConditions() })
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                }
                VStack (spacing: 50) {
                    Section {
                        Text("Your score is: \(playersScore)")
                    }
                }
            }
        }
        .alert(isPresented: $endGameAlertPopUp) {
            Alert(title: Text("Your game has ended"), message: Text("Your final score is: \(playersScore)"), dismissButton: .default(Text("New game")) {
                self.startNewGame()
            })
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
