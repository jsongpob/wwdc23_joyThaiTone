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
            if (gameState.countDownTimer >= 6)
            {
                Text("Are you ready?")
                    .font(.system(size: 100, weight: .semibold, design: .rounded))
                Button
                {
                    gameState.startCountDown()
                    self.readyButton = true
                    gameState.cancelGameDisable = true
                } label:
                {
                    Text("READY")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .frame(width: 200, height: 40)
                }
                .disabled(readyButton)
                .buttonStyle(.borderedProminent)
            }
            else if (gameState.countDownTimer == 0)
            {
                Text("Go!")
                    .font(.system(size: 300, weight: .semibold, design: .rounded))
            }
            else
            {
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
            if (gameState.gameStarted == true && gameState.gameMode == 1)
            {
                GameNormalModeView()
                    .onAppear
                {
                    gameState.NormalModeStart()
                }
            }
            else if (gameState.gameStarted == true && gameState.gameMode == 2)
            {
                GameHardModeView()
                    .onAppear
                {
                    gameState.cancelGame()
                }
            }
            else
            {
                CountDownView()
            }
        }

    }
}



//NORMAL MODE
struct GameNormalModeView: View {
    
    @EnvironmentObject var gameState: GameState
    
    let gridItems = Array(repeating: GridItem(.fixed(180), spacing: 16, alignment: .center), count: 7)
    let adaptiveColumns = [GridItem(.adaptive(minimum: 550, maximum: .infinity), alignment: .center)]
    
    var body: some View {
//        if ()
        HStack(spacing: 40) {
            Spacer()
            //LEFT VIEW
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("Round \(gameState.currentRounds) (Normal)")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray)
                    Text("Find this ThaiTone color!")
                        .font(.system(size: 36, weight: .semibold, design: .rounded))
                }
                Hexagon()
                    .foregroundColor(gameState.randomColor)
                    .frame(width: 330, height: 370, alignment: .center)
                    .overlay {
                        VStack {
                            Text("\(gameState.getColorName(for: gameState.hexCode))")
                                .font(.system(size: 28, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    .onAppear
                {
                    gameState.randomColors()
                }
                .onTapGesture
                {
                    gameState.currentRounds += 1
                }
                
                ProgressView(value: gameState.gameTimerCountDown, total: gameState.gameTotalTimerCountDown) {
                    HStack {
                        Text("\(Int(gameState.gameTimerCountDown))s")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        if (gameState.currentFail > 0)
                        {
                            Text("(\(Int(gameState.currentFail))/5 Fail)")
                                .font(.system(size: 25, weight: .semibold, design: .rounded))
                                .foregroundColor(.benjarongC2)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .progressViewStyle(LinearProgressViewStyle(tint: gameState.randomColor))
                .animation(.spring(),value: gameState.currentRounds)
                Spacer()
            }
            .frame(maxWidth: 400, maxHeight: .infinity)
            Collections()
            Spacer()
        }
        .background(gameState.backgroundColors)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

//HARD MODE
struct GameHardModeView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            Text("Hard Mode (in-game)")
        }
    }
}

//ENDVIEW
struct GameEndView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            Text("Congrats!")
                .font(.system(size: 72, weight: .semibold, design: .rounded))
                .foregroundColor(.orange)
            Text("You match \(gameState.currentRounds) colors!")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
        }
    }
}

//FAIL ENDVIEW
struct GameFailView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            Text("Fail Game View")
                .font(.system(size: 72, weight: .semibold, design: .rounded))
                .foregroundColor(.red)
        }
    }
}

//FAIL ENDVIEW REASON
struct GameReasonFailView: View {
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        VStack {
            Text("YOU FAIL")
                .font(.system(size: 72, weight: .semibold, design: .rounded))
                .foregroundColor(.red)
            Text("Fail of out!")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
        }
    }
}

//COLORS COLLECTIONS
struct Collections: View {
    @EnvironmentObject var gameState: GameState
    let adaptive = [GridItem(.adaptive(minimum: 100, maximum: 280))]
    
    var body: some View {
        VStack {
//            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 8) {
            LazyVGrid(columns: adaptive, spacing: 10) {
                ForEach(gameState.selectedColorsCollection, id: \.name) { value in
                    VStack {
                        Rectangle()
                            .onAppear
                            {
                                print("\(value)")
                            }
                            .frame(minWidth: 80, idealWidth: 110, maxWidth: .infinity, minHeight: 80, idealHeight: 110, maxHeight: .infinity)
                            .foregroundColor(Color(hex: value.hex))
                            .cornerRadius(15)
                            .overlay
                                {
                                VStack
                                {
                                    Text(value.name)
                                }
                                .font(.system(size: value.name.count > 14 ? 10 : value.name.count < 12 ? 16 : 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                            }
                            .onTapGesture
                                {
                                if (value.name == gameState.getColorName(for: gameState.hexCode))
                                {
                                    gameState.inGameNormalMode()
                                    gameState.backgroundColors = Color(hex: value.hex)
                                }
                                else
                                {
                                    gameState.inGameNormalModeFail()
                                    gameState.backgroundColors = Color.lightgray2
                                }
                        }
                    }
                }
            }
            .animation(.spring(),value: gameState.currentRounds)
            .padding(15)
        }
        .background(.white)
        .cornerRadius(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

//PREVIEWS
struct GameViewModes_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayView()
            .environmentObject(GameState())
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//COLOR CONVERTER
extension Color {
    init(hexString: String) {
        let scanner = Scanner(string: hexString)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}
