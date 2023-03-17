//
//  ThaiToneCardView.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 5/3/2566 BE.
//

import SwiftUI

struct ThaiToneCardView: View {
    @EnvironmentObject var gameLevelData: GameLevelData
//    @EnvironmentObject var wttsstate: wttsState
    
    let gameUnlock = [true, false, false]
    let iconLock = ["lock.fill", "play.fill"]
    let pictureList = ["Art-1", "Art-2", "Art-3", "Art-4"]
    
    @State private var progress = 0.00
    @State private var titleProgress = 0
    
    @State private var ThaiToneView = false
    @State private var ColorBookView = false
    @State private var FindGameView = false

    var body: some View {
        VStack {
            VStack {
                Text("ThaiTone")
                    .font(.system(size: 32, weight: .bold))
                Text("Play and learn to unlock. Have fun!")
//                Text("\(gameLevelData.wttsProgress) :wttsProgress.gameLevelData")
                Text("\(gameLevelData.GameLevel) :gameLevel")
//                Text("\(wttsstate.wttscompleted ? "True" : "False") :wttscompleted")
                HStack {
                    Button(action: {
                        gameLevelData.unlocklevel()
                    }) {
                        Text("Click")
                    }
                    Button(action: {
                        gameLevelData.gamereset()
                    }) {
                        Text("Reset")
                    }
                    Button(action: {
                        gameLevelData.FirstWelcomeView = true
                    }) {
                        Text("showWelcomeView")
                    }
                }
            }
            .environmentObject(GameLevelData())

            //            .frame(width: .infinity, height: 140, alignment: .center)
            .padding(.bottom, 60)
            
            //CARD
            HStack(spacing: 30) {
                
                if (gameLevelData.GameLevel >= 1) {
                    //CARD LEARN
                    Button(action: { ThaiToneView.toggle() }) {
                        CardView(titlecard: "What's ThaiTone", subtitlecard: "Learn", iconcard: "play.fill", cardimage: "Art-1", shadowcard: 30)
                    }
                    .fullScreenCover(isPresented: $ThaiToneView, onDismiss: didDismiss) {
                        HStack {
                            VStack {
                                Text("Learn")
                                    .font(.subheadline)
                                    .textCase(.uppercase)
                                    .frame(width: 400, alignment: .leading)
                                Text("ThaiTone")
                                    .font(.system(size: 36, weight: .bold))
                                    .frame(width: 400, alignment: .leading)
                            }
                            .frame(width: 1060, height: 120, alignment: .leading)
                            
                            Button(action: {
                                if (gameLevelData.wttsUnlockLevel >= 4) {
                                    gameLevelData.wttscompleted = true
                                    print("wttscompleted = true")
                                }
                                ThaiToneView.toggle()
                            })
                            {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(.gray)
                            }
                            .buttonStyle(.borderless)
                        }
                        WhatThaiToneScene().environmentObject(gameLevelData)
                    }
                    
                } else {
                    
                    DisableCardView(titlecard: "???", subtitlecard: "learn", iconcard: "lock.fill", cardimage: "", shadowcard: 10)
                    
                }
                
                if (gameLevelData.GameLevel >= 2) {
                    
                    //CARD TAKE A LOOK
                    Button(action: { ColorBookView.toggle() }) {
                        CardView(titlecard: "ThaiTone Color Book", subtitlecard: "Take a look", iconcard: "play.fill", cardimage: "Art-2", shadowcard: 30)
                    }
                    .fullScreenCover(isPresented: $ColorBookView, onDismiss: didDismiss) {
                        ScrollView {
                            HStack {
                                VStack {
                                    Text("take a look")
                                        .font(.subheadline)
                                        .textCase(.uppercase)
                                        .frame(width: 400, alignment: .leading)
                                    Text("ThaiTone colors book")
                                        .font(.system(size: 36, weight: .bold))
                                        .frame(width: 400, alignment: .leading)
                                }
                                .frame(width: 1060, height: 120, alignment: .leading)
                                
                                Button(action: { ColorBookView.toggle() }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(.borderless)
                            }
                            TTColorBookView()
                        }
                    }
                    
                } else {
                    
                    DisableCardView(titlecard: "???", subtitlecard: "take a look", iconcard: "lock.fill", cardimage: "", shadowcard: 10)
                    
                }
                
                if (gameLevelData.GameLevel >= 3) {
                    
                    //CARD PLAY
                    Button(action: { FindGameView.toggle() }) {
                        CardView(titlecard: "Find ThaiTone", subtitlecard: "Play", iconcard: "play.fill", cardimage: "Art-3", shadowcard: 30)
                    }
                    .fullScreenCover(isPresented: $FindGameView, onDismiss: didDismiss) {
                        HStack {
                            VStack {
                                Text("play")
                                    .font(.subheadline)
                                    .textCase(.uppercase)
                                    .frame(width: 400, alignment: .leading)
                                Text("Find ThaiTone")
                                    .font(.system(size: 36, weight: .bold))
                                    .frame(width: 400, alignment: .leading)
                            }
                            .frame(width: 1060, height: 120, alignment: .leading)
                            
                            Button(action: { FindGameView.toggle() }) {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(.gray)
                            }
                            .buttonStyle(.borderless)
                        }
                        //                    WhatThaiToneScene() //ChangeView
                    }
                    
                } else {
                    
                    DisableCardView(titlecard: "???", subtitlecard: "play", iconcard: "lock.fill", cardimage: "", shadowcard: 10)
                    
                }
            }
            .onChange(of: gameLevelData.GameLevel, perform: { newValue in
                if (gameLevelData.GameLevel >= 1) {
                    Sounds.play(sound: "mixkit-bonus", type: "wav")
                }
            })
            .padding([.leading, .trailing], 100)
            .padding(.bottom, 50)
            
            ProgressView(value: Float(gameLevelData.GameProgress)) {
                Text("\(Int(gameLevelData.GameProgress*100))% completed (Temporary Debug)")
                    .frame(width: 333)
                    .font(.subheadline)
            }
            .padding([.leading,.trailing], 430)
            .progressViewStyle(.automatic)
        }
    }
}

struct ThaiToneCardView_Previews: PreviewProvider {
    static var previews: some View {
        ThaiToneCardView()
            .environmentObject(GameLevelData())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
