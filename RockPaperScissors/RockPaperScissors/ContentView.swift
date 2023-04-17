//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ton Silva on 14/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var gameOptions = ["rock", "paper", "scissors"]
    var buttonSize: CGFloat = 50
    
    @State private var userChoices = ""
    @State private var machineChoices = ""
    @State private var roundResults = ("","")
    @State private var showingResult = false
    @State private var didUserWin: Bool = false
    @State private var score: Int = 0
    @State private var roundsLeft: Int = 9
    
    
    var body: some View {
        VStack {
            Text("Tap on your choice")
                .font(.title)
            HStack {
                Button {
                    validateUserChoice(choice: "rock")
                } label: {
                    Text("🪨")
                        .font(.system(size: buttonSize))
                        .padding()
                        .shadow(radius: 20)
                        .background(
                            Circle()
                                .stroke(Color.gray, lineWidth: 3.0)
                        )
                }
                .padding()

                Button {
                    validateUserChoice(choice: "paper")
                } label: {
                    Text("🗞️")
                        .font(.system(size: buttonSize))
                        .padding()
                        .shadow(radius: 20)
                        .background(
                            Circle()
                                .stroke(Color.gray, lineWidth: 3.0)
                        )
                }
                .padding()
                
                Button {
                    validateUserChoice(choice: "scissors")
                } label: {
                    Text("✂️")
                        .font(.system(size: buttonSize))
                        .padding()
                        .shadow(radius: 20)
                        .background(
                            Circle()
                                .stroke(Color.gray, lineWidth: 3.0)
                        )
                }
                .padding()
            }
            
            HStack {
                VStack {
                    Text("Score")
                    Text("\(score)")
                        .foregroundColor(score > -1 ? .black : .red)
                }
                .padding()
                
                VStack {
                    Text("Remaining Rounds")
                    Text("\(roundsLeft)")
                        .foregroundColor(roundsLeft > -1 ? .black : .black.opacity(0.0))
                }
                .padding()
            }
        }
        .alert(roundsLeft > -1 ? "Result:" : "Congrats!!!", isPresented: $showingResult) {
            if roundsLeft == -1 {
                Button("Restart", action: restartGame)
            }
        } message: {
            if roundResults.0 == "won" && roundsLeft > -1{
                Text("Congrats 🥳🥳🥳!!!\n You won against \(roundResults.1).")
            } else if roundResults.0 == "lost" && roundsLeft > -1 {
                Text("Bad choice 😭😭😭!!!\n You lost against \(roundResults.1).")
            } else if roundResults.0 == "tied" && roundsLeft > -1 {
                Text("Tied👀👀👀!!!\n Both of you chose \(roundResults.1).")
            } else {
                Text("The game is over!\n You \(roundResults.0) the last round and your final score is \(score).")
            }
        }
    }
    
    func validateUserChoice(choice: String) {
        if roundsLeft > -1 {
            switch choice {
            case "rock":
                checkMatchRockButton()
            case "paper":
                checkMatchPaperButton()
            default:
                checkMatchScissorsButton()
            }
            roundsLeft -= 1
            showingResult = true
        }
    }
    
    func checkMatchRockButton() {
        machineChoices = gameOptions[Int.random(in: 0..<3)]
        if machineChoices == "scissors" {
            score += 1
            roundResults = ("won","scissors")
            print("+1")
            print(machineChoices)
        } else if machineChoices == "paper"{
            score -= 1
            roundResults = ("lost","paper")
            print("-1")
            print(machineChoices)

        } else {
            roundResults = ("tied","rock")
            print("0")
            print(machineChoices)
        }
        
    }
    
    func checkMatchPaperButton() {
        machineChoices = gameOptions[Int.random(in: 0..<3)]
        if machineChoices == "rock" {
            score += 1
            roundResults = ("won","rock")
            print("+1")
            print(machineChoices)
        } else if machineChoices == "scissors"{
            score -= 1
            roundResults = ("lost","scissors")
            print("-1")
            print(machineChoices)

        } else {
            roundResults = ("tied","paper")
            print("0")
            print(machineChoices)
        }
    }
    
    func checkMatchScissorsButton() {
        machineChoices = gameOptions[Int.random(in: 0..<3)]
        if machineChoices == "paper" {
            score += 1
            roundResults = ("won","paper")
            print("+1")
            print(machineChoices)
        } else if machineChoices == "rock"{
            score -= 1
            roundResults = ("lost","rock")
            print("-1")
            print(machineChoices)

        } else {
            roundResults = ("tied","scissors")
            print("0")
            print(machineChoices)
        }
    }
    
    func restartGame() {
        score = 0
        roundsLeft = 9
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
