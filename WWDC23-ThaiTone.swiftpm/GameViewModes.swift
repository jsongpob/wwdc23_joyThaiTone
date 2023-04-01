//
//  GameViewModes.swift
//  ThaiTone
//
//  Created by Songpob Hamthanan on 29/3/2566 BE.
//

import SwiftUI

//COUNTDOWN VIEW
struct CountDownView: View {
    @EnvironmentObject var gameState: GameState
    @State var readyButton = false
    
    var body: some View {
        VStack {
            if (gameState.countDownTimer >= 6) {
                Text("Are you ready?")
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                Button {
                    gameState.startCountDown()
                    self.readyButton = true
                    gameState.cancelGameDisable = true
                } label: {
                    Text("READY")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .frame(width: 200, height: 40)
                }
                .disabled(readyButton)
                .buttonStyle(.borderedProminent)
            } else if (gameState.countDownTimer == 0) {
                Text("Go!")
                    .font(.system(size: 300, weight: .semibold, design: .rounded))
            } else {
                Text("\(gameState.countDownTimer)")
                    .font(.system(size: 300, weight: .semibold, design: .rounded))
            }
        }
    }
}



//MAIN GAMEPLAY VIEW
struct GamePlayView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            
//            Text("Hardmode: \(gameState.hardmode ? "true" : "false")")
            
            if (gameState.gameStarted == true && gameState.gameMode == 1) {
               GameNormalModeView()
                    .onAppear {
                        gameState.cancelGame()
                        gameState.gameTimer()
                        gameState.gameTotalTimerCountDown = 10.0
                        gameState.gameTimerCountDown = 10.0
                    }
            } else if (gameState.gameStarted == true && gameState.gameMode == 2) {
                GameHardModeView()
                    .onAppear {
                        gameState.cancelGame()
                    }
            } else if (gameState.Endgame == true) {
                GameEndView()
            } else {
                CountDownView()
            }
            
        }
//        .environmentObject(GameState())
    }
}



//NORMAL MODE
struct GameNormalModeView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Round ?/? (Normal)")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
                Text("Find this ThaiTone color!")
                    .font(.system(size: 36, weight: .semibold, design: .rounded))
            }
            Hexagon()
                .foregroundColor(.lightgray)
                .frame(maxWidth: 330, maxHeight: 370, alignment: .center)
                .padding(30)
//            Text("\(gameState.countDownTimer)")
            ProgressView(value: gameState.gameTimerCountDown, total: gameState.gameTotalTimerCountDown) {
                Text("\(Int(gameState.gameTimerCountDown))s")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
            }
//            .animation(.spring(), value: gameState.gameTimerCountDown)
            .progressViewStyle(LinearProgressViewStyle(tint: .orange))
            .padding(.horizontal, 50)
        }
//        .environmentObject(GameState())
    }
}

//HARD MODE
struct GameHardModeView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            Text("Hard Mode (in-game)")
//            Text("\(gameState.countDownTimer)")
        }
//        .environmentObject(GameState())
    }
}


//PREVIEWS
struct GameViewModes_Previews: PreviewProvider {
    static var previews: some View {
        GameNormalModeView()
            .environmentObject(GameState())
            .previewInterfaceOrientation(.landscapeRight)
    }
}


//ENDVIEW
struct GameEndView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            Text("End Game View")
                .font(.largeTitle)
//            Text("\(gameState.countDownTimer)")
        }
//        .environmentObject(GameState())
    }
}
