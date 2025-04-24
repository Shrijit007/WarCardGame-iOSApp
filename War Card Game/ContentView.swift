//
//  ContentView.swift
//  War Card Game
//
//  Created by Shrijit Raj on 03/12/24.
//

import SwiftUI
struct ContentView: View {
    
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var backgroundImage = "background-cloth"
    @State var result = " "
    var body: some View {
        ZStack{
            Image(backgroundImage)
                .edgesIgnoringSafeArea(.all)
            VStack(){
                Spacer()
                Spacer()
                Spacer()
                HStack(){
                    Spacer()
                    Menu {
                        Button("Cloth") {
                            backgroundImage = "background-cloth"
                        }
                        Button("Smooth") {
                            backgroundImage = "background-plain"
                        }
                        Button("Wood") {
                            backgroundImage = "background-wood-grain"
                        }
                        Button("Cartoon") {
                            backgroundImage = "background-wood-cartoon"
                        }
                    } label: {
                        Image(systemName:"ellipsis")
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button {
                        reset()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    Spacer()
                } .foregroundColor(.white)
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("YOU")
                            .font(.title3)
                            .padding(.bottom, 20.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.title3)
                            .padding(.bottom, 20.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }   .foregroundColor(.white)
                Spacer()
                Spacer()
                Spacer()
            }
            Text(result).font(.headline).fontWeight(.bold).foregroundColor(.orange)
        }
    }
    
    func deal(){
        //value variables
        let playerNum = Int.random(in: 2...14)
        let cpuNum = Int.random(in: 2...14)
        
        //randomise the cards
        playerCard = "card" + String(playerNum)
        cpuCard = "card" + String(cpuNum)
        
        //compare and update score
        if(cpuNum > playerNum){
            cpuScore += 1
            result = "LOSE"
        } else if (cpuNum < playerNum){
            playerScore += 1
            result = "WIN"
        } else {
            result = "TIE"
        }
    }
    
    func reset(){
        playerScore = 0
        cpuScore = 0
        playerCard = "back"
        cpuCard = "back"
        result = " "
    }
}

#Preview {
    ContentView()
}
