//
//  FindGameState.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 29/3/2566 BE.
//

import Foundation
import SwiftUI

class GameState: ObservableObject {
    
    @Published var gameIsNormalModeShowing = false
    @Published var gameIsHardModeShowing = false
    @Published var isModeSelectShowingSheet = false
    @Published var isEndGameViewShowingSheet = false

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
    
    //GAME RESET
    func gameReset() {
        countDownTimer = 8
        gameStarted = false
        gameMode = 0
        gameTimerStop()
        Endgame = false
    }
    @Published var cancelGameDisable = false
    func cancelGame() {
        cancelGameDisable = false
    }
    
    //GAMEPLAY
    @Published var gameStarted = false
    @Published var gameMode = 0
    
    //GAME-STARTING SETUP
    
    //GAME-TIMER
    @Published var gameTotalTimerCountDown: Float = 30.0
    @Published var gameTimerCountDown: Float = 30.0 {
        didSet {
            print("gameTimerCountDown = \(gameTimerCountDown)/\(gameTotalTimerCountDown)")
            if (gameTimerCountDown == 0) {
                Endgame = true
                gameIsNormalModeShowing = false
                isModeSelectShowingSheet = false
                isEndGameViewShowingSheet = true
                gameReset()
            }
        }
    }
    @State private var gametimer: Timer?
    
    func gameTimer() {
        gametimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { gametimer in
            if (self.gameTimerCountDown > 0) {
                self.gameTimerCountDown -= 1
            } else {
                gametimer.invalidate()
            }
        }
    }
    func gameTimerStop() {
        gametimer?.invalidate()
        gameTimerCountDown = -1
        gametimer = nil
    }
    
    //END GAME SETUP
    @Published var Endgame = false
    
}
