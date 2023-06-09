//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ton Silva on 14/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var gameOptions = ["rock", "paper", "scissors"]
    var machineImages = ["🪨", "🗞️", "✂️","👀"]
    var buttonSize: CGFloat = 50
    
    @State private var currentMachineIcon = 3
    @State private var userChoices = ""
    @State private var machineChoices = ""
    @State private var roundResults = ("","")
    @State private var showingResult = false
    @State private var didUserWin: Bool = false
    @State private var score: Int = 0
    @State private var roundsLeft: Int = 9
    
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment:.leading) {
                    Text("Score")
                        .bold()
                    Text("\(score)")
                        .foregroundColor(score > -1 ? .black : .red)
                }
                .padding()
            
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Remaining Rounds")
                        .bold()
                    Text("\(roundsLeft)")
                        .foregroundColor(roundsLeft > -1 ? .black : .black.opacity(0.0))
                }
                .padding()
            }
            
            Spacer()
            
            VStack {
                Text("Opponent")
                    .font(.title)
                Text(machineImages[currentMachineIcon])
                    .font(.system(size: buttonSize))
                    .padding()
                    .shadow(radius: 20)
                    .background(
                        Circle()
                            .stroke(Color.gray, lineWidth: 3.0)
                    )
            }
            .padding(40)
            
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
            
            Text("Tap on your choice")
                .font(.title)
            
            Spacer()
            Spacer()
        }
        .alert(roundsLeft > -1 ? "Result:" : "Congrats!!!", isPresented: $showingResult) {
            if roundsLeft == -1 {
                Button("Restart", action: restartGame)
            } else {
                Button("Ok", action: restarMachineIcon)
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
        currentMachineIcon = Int.random(in: 0..<3)
        machineChoices = gameOptions[currentMachineIcon]
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
        currentMachineIcon = Int.random(in: 0..<3)
        machineChoices = gameOptions[currentMachineIcon]
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
        currentMachineIcon = Int.random(in: 0..<3)
        machineChoices = gameOptions[currentMachineIcon]
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
        currentMachineIcon = 3
        score = 0
        roundsLeft = 9
    }
    
    func restarMachineIcon() {
        currentMachineIcon = 3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
