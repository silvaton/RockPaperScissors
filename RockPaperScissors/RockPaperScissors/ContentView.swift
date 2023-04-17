//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ton Silva on 14/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var gameOptions = ["rock", "paper", "scissors"]
    @State private var userChoices = ""
    @State private var machineChoices = ""
    @State private var didUserWin: Bool = false
    @State private var score: Int = 0
    @State private var roundsLeft: Int = 9
    var buttonSize: CGFloat = 50
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
                }
                .padding()
                
                VStack {
                    Text("Remaining Rounds")
                    Text("\(roundsLeft)")
                }
                .padding()
            }
        }
    }
    
    func validateUserChoice(choice: String) {
        if roundsLeft > 0 {
            roundsLeft -= 1
            switch choice {
            case "rock":
                checkMatchRockButton()
            case "paper":
                checkMatchPaperButton()
            default:
                checkMatchScissorsButton()
            }
        }
    }
    
    func checkMatchRockButton() {
        machineChoices = gameOptions[Int.random(in: 0..<3)]
        if machineChoices == "scissors" {
            score += 1
            print("+1")
            print(machineChoices)
        } else if machineChoices == "paper"{
            score -= 1
            print("-1")
            print(machineChoices)

        } else {
            print("0")
            print(machineChoices)
        }
    }
    
    func checkMatchPaperButton() {
        machineChoices = gameOptions[Int.random(in: 0..<3)]
        if machineChoices == "rock" {
            score += 1
            print("+1")
            print(machineChoices)
        } else if machineChoices == "scissors"{
            score -= 1
            print("-1")
            print(machineChoices)

        } else {
            print("0")
            print(machineChoices)
        }
    }
    
    func checkMatchScissorsButton() {
        machineChoices = gameOptions[Int.random(in: 0..<3)]
        if machineChoices == "paper" {
            score += 1
            print("+1")
            print(machineChoices)
        } else if machineChoices == "rock"{
            score -= 1
            print("-1")
            print(machineChoices)

        } else {
            print("0")
            print(machineChoices)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
