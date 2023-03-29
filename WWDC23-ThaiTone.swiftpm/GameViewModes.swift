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




struct GameNormalModeView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            
//            Text("Normal Mode (in-game)")
//            Text("\(gameState.countDownTimer)")
            
            if (gameState.gameStarted == true) {
                Text("IN-GAME")
            } else {
                CountDownView()
            }
            
        }
    }
}

struct GameViewModes_Previews: PreviewProvider {
    static var previews: some View {
        GameNormalModeView()
            .environmentObject(GameState())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
