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
    var buttonSize: CGFloat = 50
    var body: some View {
        VStack {
            Text("Tap on your choice")
                .font(.title)
            HStack {
                Button {
                    checkMatch(choice: "stone")
                } label: {
                    Text("🪨")
                        //.font(.largeTitle)
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
                    checkMatch(choice: "stone")
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
                    checkMatch(choice: "stone")
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
                    Text("0")
                }
    
            }
        }
    }
    
    func checkMatch(choice: String) {
        let random = Int.random(in: 0..<3)
        machineChoices = gameOptions[random]
        print(random)
        print(machineChoices)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
