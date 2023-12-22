//
//  ChessVIewModel.swift
//  chessStopWatch
//
//  Created by Yash Goyal0 on 09/10/23.
//

import Foundation
import SwiftUI

final class ChessViewModel: ObservableObject {
    
    @Published var circleColor:Color = .white
    @Published var bgColor:Color = .black
    
    
   
    
    func nextPlayerTurn() {
        if(circleColor == .black) {
            circleColor = .white
            bgColor = .black
            }
        else {
            circleColor = .black
            bgColor = .white
        }
        
    }
    
    
    
}
