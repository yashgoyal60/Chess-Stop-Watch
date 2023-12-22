//
//  ContentView.swift
//  chessStopWatch
//
//  Created by Yash Goyal0 on 09/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var chessVM = ChessViewModel()
    @StateObject var playerVM1 = PlayerViewModel(playerTurn: true, playerName:"Yash")
    @StateObject var playerVM2 = PlayerViewModel(playerName:"Rahul")
    

    
//    @State private var timeRemaining = 100
//    @State private var timerRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let activePlayer:PlayerViewModel = getActivePlayerDetail()
        ZStack {
            Rectangle()
                .foregroundColor(chessVM.bgColor)
                .scaledToFill()
            
            ZStack {
                
                    
                Circle().fill(chessVM.circleColor).frame(width: 200)
                
                VStack{
                    Text(activePlayer.playerName)
                        .foregroundColor(.green)
                        .font(.title)
                        .fontWeight(.heavy)
                        .offset(y:-40)

                    Text("Time: \(activePlayer.timeRemaining)")
                        .font(.title)
                        .bold()
                    .foregroundColor(chessVM.bgColor)
                    .onReceive(timer) { timer in
                        if (activePlayer.timeRemaining > 0 && activePlayer.playerTurn) {
                            activePlayer.timeRemaining += -1
                        }
                        else {
                            
                        }
                    }
                }
                
            } .onTapGesture {
                chessVM.nextPlayerTurn()
                playerVM1.playerTurn.toggle()
                playerVM2.playerTurn.toggle()
                
            }
            
            
//            Button {
//                chessVM.nextPlayerTurn()
//
//            } label: {
//                Text("Time: \(timeRemaining)")
//                    .font(.title)
//                    .bold()
//                    .foregroundColor(chessVM.bgColor)
//            }
            
            //            .frame(maxWidth: .infinity, maxHeight: 500)
            
            //        .padding()
        }
        
    }
    
    func getActivePlayerDetail() -> PlayerViewModel {
        if(playerVM1.playerTurn == true)
            {
                return playerVM1
            }
        else {
            return playerVM2
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
