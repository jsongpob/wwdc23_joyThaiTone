//
//  FindGameView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 9/3/2566 BE.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameState: GameState
    
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
                    }
                    else if (gameState.gameTimerCountDown >= 0 && gameState.gameFail == true)
                    {
                        GameReasonFailView()
                    }
                    else if (gameState.gameTimerCountDown <= 0 && gameState.currentRounds == 0)
                    {
                        GameFailView()
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
                }
                .sheet(isPresented: $isHowtoShowingSheet, onDismiss: didDismiss) {
                    Text("How to play")
                }
                //HOWTO
                Spacer()
                
                //LEADERBAORD
                Button {
                    isLeaderShowingSheet.toggle()
                } label: {
                    Text("Leaderboard")
                }
                .sheet(isPresented: $isLeaderShowingSheet, onDismiss: didDismiss) {
                    Text("Leaderboard")
                }
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


