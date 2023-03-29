//
//  FindGameState.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 29/3/2566 BE.
//

import Foundation
import SwiftUI

class GameState: ObservableObject {
    
    //COUNTDOWN
    @Published var countDownTimer = 8 {
        didSet {
            if (countDownTimer == -1) {
                gameStarted = true
            }
        }
    }
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    //FUNCTION COUNTDOWN
    func startCountDown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if (self.countDownTimer >= 0) {
                self.countDownTimer -= 1
            } else {
                timer.invalidate()
            }
        }
    }
    //END FUNCTION COUNTDOWN
    
    //GAMEPLAY
    @Published var gameStarted = false {
        didSet {
            print("gameStarted = \(gameStarted)")
        }
    }
}
