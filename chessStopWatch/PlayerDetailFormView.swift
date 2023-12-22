//
//  PlayerDetailForm.swift
//  chessStopWatch
//
//  Created by Yash Goyal0 on 09/10/23.
//

import SwiftUI
//Problem is if controller remains there it rexceives that value only

struct PlayerDetailFormView: View {
    
    
    @State var time: Int = 100
    
    @ObservedObject var playerVM1 = PlayerViewModel()
    @ObservedObject var playerVM2 = PlayerViewModel()
    
    func reset() -> Void {
        playerVM1.playerTurn = true
        time = 100
//        self.time = 100
        
        
    }
    
    func setTime() {
        playerVM1.timeRemaining = time
        playerVM2.timeRemaining = time
    }
    
    var body: some View {
        NavigationStack {
        ZStack {
            Form {
                Section(header:
                    Text("Players Info")
                    .font(.body)
                    .foregroundColor(.black)
                    .offset(x : 110)
                ) {


                    TextField("First Player Name", text: $playerVM1.name)
                    TextField("Second Player Name", text: $playerVM2.name)
                    
                    TextField("Time", value: $time, formatter: NumberFormatter())
                    
                }
            }
            .onAppear(){reset()}

            TextField("Time", value: $time, formatter: NumberFormatter())
            
            HStack {
                NavigationLink{ChessTimerView(time: time, playerVM1: playerVM1, playerVM2: playerVM2).onAppear(){setTime()}}
                    label: {
                        Text("Save")
                            .frame(width: 200, height: 40)
                            .background(Color.green)
                            .foregroundColor(Color(.systemBackground))
                            .cornerRadius(10)
                    }.offset(y: 340)

            }
           }
        
        }
        
        .navigationBarHidden(true)
        
        
    }
    
    func setValue(time : Int) -> Void {
        playerVM1.timeRemaining  = time
        playerVM2.timeRemaining  = time
     
    }
   
}



//struct PlayerDetailFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerDetailFormView(time:0)
//    }
//}
