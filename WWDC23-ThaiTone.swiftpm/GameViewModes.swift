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
                    gameState.gameTimer()
                    gameState.gameTotalTimerCountDown = 6.0
                    gameState.gameTimerCountDown = 6.0
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
        HStack(spacing: 30) {
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
                Spacer()
            }
            .frame(maxWidth: 400, maxHeight: .infinity)
//            .border(.red)
            Collections()
//            Spacer()
        }
//        .border(.red)
        .background(gameState.backgroundColors)
//        .animation(.linear(duration: 0.1), value: gameState.backgroundColors)
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
                .font(.largeTitle)
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

struct Collections: View {
    @EnvironmentObject var gameState: GameState
    
//    static let size: CGFloat = 130
//    static let spacingBetweenColumns: CGFloat = 8
//    static let spacingBetweenRows: CGFloat = 8
//    static let totalColumns: Int = 5
    
//    let gridItems = Array(repeating: GridItem(.fixed(size), spacing: spacingBetweenColumns, alignment: .center), count: totalColumns)
    
    var body: some View {
//        ScrollView([.vertical], showsIndicators: false) {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 8) {
//            VStack {
//            LazyVGrid(columns: gridItems, alignment: .center, spacing: 10) {
                ForEach(gameState.selectedColorsCollection, id: \.name) { value in
                    VStack {
                        Rectangle()
                            .onAppear{
                                print("\(value)")
                            }
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: .infinity, minHeight: 100, idealHeight: 120, maxHeight: .infinity)
                            .foregroundColor(Color(hex: value.hex))
                            .cornerRadius(15)
    //                        .frame(height: Self.size)
                            .overlay {
                                VStack
                                {
                                    Text(value.name)
                                }
                                .font(.system(size: value.name.count > 18 ? 10 : value.name.count < 12 ? 16 : 12, weight: .semibold, design: .rounded))
                                .foregroundColor(.white)
                            }
                            .onTapGesture {
                                if (value.name == gameState.getColorName(for: gameState.hexCode))
                                {
    //                                print(gameState.getColorName(for: gameState.hexCode))
    //                                print("\(collection.name)")
    //                                print("+1")
                                    gameState.randomColors()
                                    gameState.currentRounds += 1
                                    gameState.gameTimerCountDown += 1
                                    gameState.backgroundColors = Color(hex: value.hex)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                        withAnimation {
                                            self.gameState.backgroundColors = Color.white
                                        }
                                    }
                                }
                                else
                                {
                                    if (gameState.gameTimerCountDown >= 0)
                                    {
                                        gameState.currentFail += 1
                                        gameState.gameTimerCountDown -= 2
                                        gameState.backgroundColors = Color.lightgray2
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                            withAnimation {
                                                self.gameState.backgroundColors = Color.white
                                            }
                                        }
                                    }
                                }
                        }
                    }
                }
            }
            .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//        .border(.red)
    }
}
