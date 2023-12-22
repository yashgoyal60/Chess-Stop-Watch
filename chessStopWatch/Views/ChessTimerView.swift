//
//  ContentView.swift
//  chessStopWatch
//
//  Created by Yash Goyal0 on 09/10/23.
//

import SwiftUI

struct ChessTimerView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    @StateObject var chessVM = ChessViewModel()
    let time: Int
    var h=0,m=0,s=0
    
    
    @ObservedObject var playerVM1: PlayerViewModel
    @ObservedObject var playerVM2: PlayerViewModel
    
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
    let activePlayer = getActivePlayerDetail()
    
        ZStack {
            Rectangle()
                .foregroundColor(chessVM.bgColor)
                .scaledToFill()
            
            ZStack {
                
                
                Image("chessImage")
                  .resizable()
                  .scaledToFill()
                  .frame(width: 250, height: 250)
                  .foregroundColor(.white)
                  .background(Color.green)
                  .clipShape(Circle())
                
                VStack{
                    Text(activePlayer.name)
                        .foregroundColor(.green)
                        .font(.title)
                        .fontWeight(.heavy)
                        .offset(y:-40)
                    
                    Text("   Time \n "+secondsToHoursMinutesSeconds(activePlayer.timeRemaining))
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                    .onReceive(timer) { timer in
                        if (activePlayer.timeRemaining > 0 && activePlayer.playerTurn) {
                            activePlayer.timeRemaining += -1
                            print(activePlayer.timeRemaining)
                        }
                        else {
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                
            }
            .onTapGesture {
                if(activePlayer.timeRemaining > 0)
                {
                    chessVM.nextPlayerTurn()
                    playerVM1.playerTurn.toggle()
                    playerVM2.playerTurn.toggle()
                }
            }
            
        }
        
        .navigationBarBackButtonHidden(false)
        
        
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> String {
        
        var k: String = String((seconds)/60) + "m ";
        k += String((seconds%3600)%60)
        k += "s"
        return k
                
    }
    
    func secondsToHoursMinutesSeconds1(_ seconds: Int) -> (Int, Int, Int) {
//        self.h = seconds / 3600
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        
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

struct ChessTimerView_Previews: PreviewProvider {

    static var previews: some View {
        ChessTimerView(time: 0,
                       playerVM1: PlayerViewModel(timeRemaining: 10), playerVM2: PlayerViewModel(timeRemaining: 10))
    }
}
