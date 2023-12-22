//
//  PlayerViewModel.swift
//  chessStopWatch
//
//  Created by Yash Goyal0 on 09/10/23.
//

import Foundation

class PlayerViewModel: ObservableObject {
    @Published var timeRemaining: Int
    @Published var playerTurn:Bool = false
    @Published var name:String
    
    public init(timeRemaining: Int = 0, playerTurn: Bool=false) {
        self.timeRemaining = timeRemaining
        self.playerTurn = playerTurn
        self.name = ""
    }
    

    
  
    
}

//class PlayerDetail: ObservableObject {
//  
//}
