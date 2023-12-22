//
//  PlayerDetailForm.swift
//  chessStopWatch
//
//  Created by Yash Goyal0 on 09/10/23.
//

import SwiftUI
//Problem is if controller remains there it receives that value only

struct PlayerDetailFormView: View {
    
//    enum Field: Hashable {
//            case myField
//        }
//    @FocusState private var nameIsFocused: Field?
    
    @State var time: Int?
    
    @ObservedObject var playerVM1 = PlayerViewModel()
    @ObservedObject var playerVM2 = PlayerViewModel()
    
    func reset() -> Void {
        playerVM1.playerTurn = true
        time = nil
        playerVM1.name = ""
        playerVM2.name = ""
    }
    
    func setTime() {
        playerVM1.timeRemaining = time!*60
        playerVM2.timeRemaining = time!*60
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
                    
                    TextField("Timer in minutes", value: $time, formatter: NumberFormatter())
                    
                }
            }
            .onAppear(){reset()}
            
            
            

            TextField("Time", value: $time, formatter: NumberFormatter())
            
            HStack {
                NavigationLink{
                    ChessTimerView(time: time ?? 0, playerVM1: playerVM1, playerVM2: playerVM2)
                        .onAppear(){
                            setTime()
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)

                        }
                                    
                }
                
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



struct PlayerDetailFormView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailFormView(time:0)
    }
}
