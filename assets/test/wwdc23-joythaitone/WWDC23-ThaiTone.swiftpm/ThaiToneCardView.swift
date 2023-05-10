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
    
    @State var debuging = false
    
    var body: some View {
        VStack {
            Spacer()
            
            //TITLE
            VStack {
                Text("joyThaiTone")
                    .font(.system(size: 48, weight: .bold))
                Text("Learn and play to unlock new things in ThaiTone. Have fun!")
                    .font(.title2)
                    .onTapGesture(count: 3) {
                        debuging.toggle()
                    }
                
                //DEBUG TEXTVIEW
                if (debuging == true) {
                    HStack {
                        Text("\(gameLevelData.GameLevel) :gameLevel")
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
                //DEBUG TEXTVIEW
            }
            .environmentObject(GameLevelData())
            
            //            .frame(width: .infinity, height: 140, alignment: .center)
            
            //CARD
            //            HStack(spacing: 30)
            //            let flexColumns: [GridItem] = [
            //                GridItem(.flexible()),
            //                GridItem(.flexible()),
            //                GridItem(.flexible())
            //            ]
            
            let adaptiveColumns = [GridItem(.adaptive(minimum: 220, maximum: 260), spacing: 100, alignment: .center)]
            //            let fixedColumns = [
            //                GridItem(.fixed(330)),
            //                GridItem(.fixed(330)),
            //                GridItem(.fixed(330))
            //            ]
            
            Spacer()
            
            //CONTENT CARD
            LazyVGrid(columns: adaptiveColumns, alignment: .center, spacing: 50) {
                if (gameLevelData.GameLevel >= 1) {
                    //CARD LEARN
                    Button(action: { ThaiToneView.toggle() }) {
                        CardView(titlecard: "What's ThaiTone", subtitlecard: "(1/3) Learn", iconcard: "", cardimage: "thaitone_card", shadowcard: 30)
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
                            .frame(width: 400, height: 120, alignment: .leading)
                            
                            Spacer()
                            
                            Text("Read the article")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                                .frame(width: 320, alignment: .trailing)
                            
                            Button(action: {
                                if (gameLevelData.wttsUnlockLevel == 3 && gameLevelData.wttscompleted != true) {
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
                        .padding(.horizontal, 50)
                        WhatThaiToneScene().environmentObject(gameLevelData)
                    }
                } else {
                    DisableCardView(titlecard: "???", subtitlecard: "(1/3) Learn", iconcard: "lock.fill", cardimage: "", shadowcard: 10)
                        .onAppear {
                            gameLevelData.FirstWelcomeView = true
                        }
                }
                
                
                if (gameLevelData.GameLevel >= 2) {
                    
                    //CARD TAKE A LOOK
                    Button(action: { ColorBookView.toggle() }) {
                        CardView(titlecard: "ThaiTone Collection", subtitlecard: "(2/3) Take a look", iconcard: "", cardimage: "colorsbook_card", shadowcard: 30)
                    }
                    .fullScreenCover(isPresented: $ColorBookView, onDismiss: didDismiss) {
                        ScrollView {
                            HStack {
                                VStack {
                                    Text("take a look (168)")
                                        .font(.subheadline)
                                        .textCase(.uppercase)
                                        .frame(width: 330, alignment: .leading)
                                    Text("ThaiTone Collection")
                                        .font(.system(size: 36, weight: .bold))
                                        .frame(width: 330, alignment: .leading)
                                }
                                .frame(width: 330, height: 120, alignment: .leading)
                                
                                Spacer()
                                
                                if (gameLevelData.colorBookSelect < 5) {
                                    Text("Challenge : try to select 5 colors you like \n(\(gameLevelData.colorBookSelect)/5)")
                                        .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                        .frame(width: 420, alignment: .trailing)
                                        .multilineTextAlignment(.trailing)
                                } else {
                                    Text("Challenge : try to select 5 colors you like \n(5/5) Completed")
                                        .font(.system(size: 16))
                                        .foregroundColor(.gray)
                                        .frame(width: 420, alignment: .trailing)
                                        .multilineTextAlignment(.trailing)
                                }
                                
                                Button(action: {
                                    if (gameLevelData.colorBookSelect >= 5 && gameLevelData.TTcolorcompleted != true) {
                                        gameLevelData.TTcolorcompleted = true
                                        gameLevelData.unlocklevel()
                                    }
                                    ColorBookView.toggle()
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(.borderless)
                            }
                            .padding(.horizontal, 50)
                            TTColorBookView()
                        }
                    }
                } else {
                    
                    DisableCardView(titlecard: "???", subtitlecard: "(2/3) Take a Look", iconcard: "lock.fill", cardimage: "", shadowcard: 10)
                    
                }
                
                if (gameLevelData.GameLevel >= 3) {
                    
                    //CARD PLAY
                    Button(action: { gameLevelData.FindGameView.toggle() }) {
                        CardView(titlecard: "ThaiTone Match", subtitlecard: "(3/3) Play", iconcard: "", cardimage: "play_card", shadowcard: 30)
                    }
                    .fullScreenCover(isPresented: $gameLevelData.FindGameView, onDismiss: didDismiss) {
                        ZStack {
                            HStack {
//                                VStack {
//                                    Text("play")
//                                        .font(.subheadline)
//                                        .textCase(.uppercase)
//                                        .frame(width: 400, alignment: .leading)
//                                    Text("Find ThaiTone")
//                                        .font(.system(size: 36, weight: .bold))
//                                        .frame(width: 400, alignment: .leading)
//                                }
//                                .frame(width: 400, height: 120, alignment: .leading)
//                                Spacer()
                                Button(action: {
                                    gameLevelData.FindGameView.toggle()
                                    if (gameLevelData.EndOneTime == true && gameLevelData.endTabUnlock == false) {
                                        gameLevelData.endTabUnlock = true
                                        gameLevelData.EndGameView = true
                                        gameLevelData.GameLevel = 4
                                    }
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(.borderless)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(30)
                            GameView()
                        }
                    }
                    
                } else {
                    
                    DisableCardView(titlecard: "???", subtitlecard: "(3/3) play", iconcard: "lock.fill", cardimage: "", shadowcard: 10)
                    
                }
                
                if (gameLevelData.endTabUnlock == true) {
                    Button(action: { gameLevelData.EndGameView.toggle() }) {
//                        CardView(titlecard: "Find ThaiTone", subtitlecard: "Play", iconcard: "", cardimage: "Art-3", shadowcard: 30)
                    }
                    .fullScreenCover(isPresented: $gameLevelData.EndGameView, onDismiss: didDismiss) {
                        ZStack {
                            HStack {
//                                VStack {
//                                    Text("play")
//                                        .font(.subheadline)
//                                        .textCase(.uppercase)
//                                        .frame(width: 400, alignment: .leading)
//                                    Text("Find ThaiTone")
//                                        .font(.system(size: 36, weight: .bold))
//                                        .frame(width: 400, alignment: .leading)
//                                }
//                                .frame(width: 400, height: 120, alignment: .leading)
//                                Spacer()
                                Button(action: { gameLevelData.EndGameView.toggle() }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 32))
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(.borderless)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(30)
//                            Text("TRUE ENDGAME VIEW")
                            EndView()
                        }
                    }
                }
            }
            .onChange(of: gameLevelData.GameLevel, perform: { newValue in
                if (gameLevelData.GameLevel >= 1) {
                    Sounds.play(sound: "mixkit-bonus", type: "wav")
                }
            })
            .padding([.leading, .trailing], 100)
            //            .padding(.bottom, 50)
            
//            Button {
//                gameLevelData.EndGameView.toggle()
//            } label: {
////                Text("111")
//            }
//            .fullScreenCover(isPresented: $gameLevelData.EndGameView, onDismiss: didDismiss) {
//                Text("TRUE END VIEW")
//            }

            
            Spacer()
            
            //            ProgressView(value: Float(gameLevelData.GameProgress)) {
            //                Text("\(Int(gameLevelData.GameProgress*100))% completed (Temporary Debug)")
            //                    .frame(width: 333)
            //                    .font(.subheadline)
            //            }
            //            .padding([.leading,.trailing], 430)
            //            .progressViewStyle(.automatic)
//            Spacer()
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