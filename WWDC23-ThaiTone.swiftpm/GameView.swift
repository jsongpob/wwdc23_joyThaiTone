//
//  FindGameView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 9/3/2566 BE.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameState: GameState
    @EnvironmentObject var gameLevelData: GameLevelData
    
    //SHEET ACTION
    @State private var isHowtoShowingSheet = false
    @State private var isLeaderShowingSheet = false
    
    var body: some View {
        
        //MAIN VIEW
        VStack {
            Spacer()
            
            //TITLE
            Text("ThaiTone Match")
                .font(.system(size: 48, weight: .semibold, design: .rounded))
            
            //BIG BUTTON PLAY
            ZStack
            {
                Hexagon()
                    .foregroundColor(.lightgray)
                    .frame(maxWidth: 330, maxHeight: 370, alignment: .center)
                    .padding(30)
                Text("Start")
                    .font(.system(size: 56, weight: .medium, design: .rounded))
            }
            .environmentObject(GameState())
            .onTapGesture
            {
                gameState.isModeSelectShowingSheet.toggle()
            }
            .fullScreenCover(isPresented: $gameState.isModeSelectShowingSheet)
            {
                //SELECT MODE TO PLAY
                ZStack {
                    VStack(spacing: 30) {
                        Text("Select Mode")
                            .font(.system(size: 36, weight: .semibold, design: .rounded))
                        //BUTTON MODE SELECT
                        VStack(spacing: 20) {

                            //NORMAL
                            Button
                            {
                                gameState.gameIsNormalModeShowing.toggle()
                                gameState.gameMode = 1
                                gameState.getColors()
                            } label:
                            {
                                Text("Normal")
                                    .font(.title)
                                    .frame(width: 290, height: 50, alignment: .center)
                            }
                            .buttonStyle(.borderedProminent)
                            .fullScreenCover(isPresented: $gameState.gameIsNormalModeShowing)
                            {
                                //CLOSE IN-GAME FULLSCREENCOVER
                                ZStack {
                                    if (gameState.gameStarted == false)
                                    {
                                        Button {
                                            gameState.gameIsNormalModeShowing.toggle()
                                            gameState.gameReset()
                                        } label: {
                                            Image(systemName: "xmark.circle.fill")
                                                .font(.system(size: 32))
                                                .foregroundColor(.gray)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                        .padding(40)
                                        .buttonStyle(.borderless)
                                        .disabled(gameState.cancelGameDisable)
                                    }
                                    GamePlayView()
                                }
                            }
                            //NORMAL
                            
                            
                            
                            //HARD
                            Button
                            {
                                gameState.gameIsHardModeShowing.toggle()
                                gameState.gameMode = 2
                            } label:
                            {
                                Text("Hard")
                                    .font(.title)
                                    .frame(width: 290, height: 50, alignment: .center)
                            }
                            .disabled(true)
                            .buttonStyle(.borderedProminent)
                            .fullScreenCover(isPresented: $gameState.gameIsHardModeShowing)
                            {
                                //CLOSE IN-GAME FULLSCREENCOVER
                                ZStack {
                                    if (gameState.gameStarted == false)
                                    {
                                        Button
                                        {
                                            gameState.gameIsNormalModeShowing.toggle()
                                            gameState.gameReset()
                                        } label:
                                        {
                                            Image(systemName: "xmark.circle.fill")
                                                .font(.system(size: 32))
                                                .foregroundColor(.gray)
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                        .padding(40)
                                        .buttonStyle(.borderless)
                                        .disabled(gameState.cancelGameDisable)
                                    }
                                    GamePlayView()
                                }
                            }
                            //HARD
                            
                            
                            
                            //ENDLESS
                            Button
                            {
                                
                            } label:
                            {
                                Text("Endless")
                                    .font(.title)
                                    .frame(width: 290, height: 50, alignment: .center)
                            }
                            .disabled(true)
                            .buttonStyle(.borderedProminent)
                            //ENDLESS
                            
                        }
                    }
                    //CLOSE MODESELECT SHEET
                    Button
                    {
                        gameState.isModeSelectShowingSheet.toggle()
                    } label:
                    {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(40)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            
            
            
            .sheet(isPresented: $gameState.isEndGameViewShowingSheet)
            {
                ZStack {
                    Button {
                        if (gameState.gameFail == true)
                        {
                            gameState.gameFail = false
                        }
                        gameState.currentRounds = 0
                        gameState.isEndGameViewShowingSheet.toggle()
                    } label:
                    {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(40)
                    .buttonStyle(.borderless)
                    
                    
                    
                    //ENDVIEW SHOW CONDITION
                    if (gameState.gameTimerCountDown <= 0 && gameState.currentRounds > 0 && gameState.gameFail != true)
                    {
                        GameEndView()
                            .onAppear {
                                Sounds.play(sound: "mixkit-completion-of-a-level", type: "mp3")
                                if (gameLevelData.EndOneTime == false) {
                                    gameLevelData.EndOneTime = true
                                }
                            }
                    }
                    else if (gameState.gameTimerCountDown >= 0 && gameState.gameFail == true)
                    {
                        GameReasonFailView()
                            .onAppear {
                                Sounds.play(sound: "mixkit-player-losing-or-failing", type: "mp3")
                            }
                    }
                    else if (gameState.gameTimerCountDown <= 0 && gameState.currentRounds == 0)
                    {
                        GameFailView()
                            .onAppear {
                                Sounds.play(sound: "mixkit-player-losing-or-failing", type: "mp3")
                            }
                    }
                    else
                    {
                        Text("ERROR")
                            .font(.system(size: 32, weight: .semibold, design: .rounded))
                    }
                    //ENDVIEW SHOW CONDITION
                    
                    
                    
                }
            }
            //END VIEW
            
            Spacer()
            
            //LOWER BUTTON ACTION
            HStack {
                //HOWTO
                Button {
                    isHowtoShowingSheet.toggle()
                } label: {
                    Text("How to play")
//                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                }
                .sheet(isPresented: $isHowtoShowingSheet, onDismiss: didDismiss) {
                        VStack {
                            Spacer()
                            VStack(spacing: 10) {
                                Image(systemName: "pencil.and.outline")
                                    .font(.system(size: 64, weight: .bold, design: .rounded))
                                    .foregroundColor(.blue)
                                Text("Find ThaiTone")
                                    .font(.system(size: 36, weight: .medium, design: .rounded))
                            }
                            Spacer()
                            VStack {
                                HStack(spacing: 30) {
                                    Image(systemName: "dice.fill")
                                        .font(.system(size: 38, weight: .bold, design: .rounded))
                                        .foregroundColor(.black)
                                    Text("This game will feature a random color that the player must select at the start of the game.")
                                        .frame(maxWidth: 450, maxHeight: 100, alignment: .leading)
                                }
                                HStack(spacing: 30) {
                                    Image(systemName: "paintbrush.fill")
                                        .font(.system(size: 38, weight: .bold, design: .rounded))
                                        .foregroundColor(.black)
                                    Text("The player's choice of color must match the color chosen at random. If a player makes more than 5 incorrect the game is over.")
                                        .frame(maxWidth: 450, maxHeight: 100, alignment: .leading)
                                }
                                HStack(spacing: 30) {
                                    Image(systemName: "timer")
                                        .font(.system(size: 38, weight: .bold, design: .rounded))
                                        .foregroundColor(.black)
                                    Text("Players have a certain amount of time to play. to be win in the game")
                                        .frame(maxWidth: 450, maxHeight: 100, alignment: .leading)
                                }
                                HStack(spacing: 30) {
                                    Image(systemName: "flag.2.crossed.circle.fill")
                                        .font(.system(size: 38, weight: .bold, design: .rounded))
                                        .foregroundColor(.black)
                                    Text("Enjoy playing games with your friends. have fun!")
                                        .frame(maxWidth: 450, maxHeight: 100, alignment: .leading)
                                }
                            }
//                            .padding(.bottom, 20)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .multilineTextAlignment(.leading)
                            Spacer()
                            Button {
                                isHowtoShowingSheet.toggle()
                            } label: {
                                Text("Let's go")
                            }
                            .buttonStyle(.bordered)
                            Spacer()
                        }
//                        .padding(80)
                }
                //HOWTO
//                Spacer()
                
                //LEADERBAORD
//                Button {
//                    isLeaderShowingSheet.toggle()
//                } label: {
//                    Text("Leaderboard")
//                }
//                .sheet(isPresented: $isLeaderShowingSheet, onDismiss: didDismiss) {
//                    Text("Leaderboard")
//                }
//                .disabled(true)
                //LEADERBAORD
            }
            .frame(width: 300, alignment: .center)
            Spacer()
        }
        .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, minHeight: 300, idealHeight: 300, maxHeight: .infinity, alignment: .center)
    }
}

//PREVIEW
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameState())
            .previewInterfaceOrientation(.landscapeRight)
    }
}

//GENARATE HEXAGON
struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let pt1 = CGPoint(x: 0, y: 90)
            let pt2 = CGPoint(x: 0, y: rect.height - 90)
            let pt3 = CGPoint(x: rect.width / 2, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y: rect.height - 90)
            let pt5 = CGPoint(x: rect.width, y: 90)
            let pt6 = CGPoint(x: rect.width / 2, y: 0)
            
            path.move(to: pt6)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 30)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 30)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 30)
            path.addArc(tangent1End: pt4, tangent2End: pt5, radius: 30)
            path.addArc(tangent1End: pt5, tangent2End: pt6, radius: 30)
            path.addArc(tangent1End: pt6, tangent2End: pt1, radius: 30)
        }
    }
}

//COLORS
extension Color {
    static let lightgray = Color("lightgray")
    static let lightgray2 = Color("lightgray2")
}


