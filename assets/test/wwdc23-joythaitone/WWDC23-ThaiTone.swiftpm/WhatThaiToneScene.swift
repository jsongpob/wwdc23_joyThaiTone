//
//  WhatThaiToneScene.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 6/3/2566 BE.
//

import SwiftUI

struct WhatThaiToneScene: View {
    @EnvironmentObject var gameLevelData: GameLevelData
    
    @State var isShowingSheetA = UserDefaults.standard.bool(forKey: "isShowingSheetA")
    @State var isShowingSheetB = UserDefaults.standard.bool(forKey: "isShowingSheetB")
    @State var isShowingSheetC = UserDefaults.standard.bool(forKey: "isShowingSheetC")
    @State var isShowingSheetD = UserDefaults.standard.bool(forKey: "isShowingSheetD")
    
    //    @StateObject var wttsstate = wttsState()
    @StateObject var appstatedata = GameLevelData()
    
    @State var titleWcardList = ["Inspiration of \nThai-tone colors", "Originator of modern Thai colors", "Origins of ThaiTone colors", ""]
    
    //    @ObservedObject var ThaiToneView = ThaiToneCardView.ThaiToneView
    
    var body: some View {
        VStack {
            //            VStack {
            //                Text("Learn")
            //                    .font(.subheadline)
            //                    .textCase(.uppercase)
            //                    .frame(width: 400, alignment: .leading)
            //                Text("ThaiTone")
            //                    .font(.system(size: 36, weight: .bold))
            //                    .frame(width: 400, alignment: .leading)
            //            }
            //            .padding(.bottom, 60)
            //            .frame(width: 1100, height: 100, alignment: .leading)
            //            .offset(x: 0.0,y: -120.0)
            
            VStack(spacing: 20) {
                //                Text("wttsUnlockLevel:\(gameLevelData.wttsUnlockLevel) wttsTest:\(gameLevelData.wttsUnlockLevelState) wttsprogress:\(gameLevelData.wttsProgress)")
                //LINE-1
                HStack(spacing: 20) {
                    
                    //PAGE-1
                    Button(action:
                            {
                        isShowingSheetA.toggle()
                        //                        wttsprogresscompleted1()
                        gameLevelData.wttsUnlock1()
                    })
                    {
                        WideCardView(titleWcard: titleWcardList[0], iconWcard: "", Wcardimage: "whatcard_inspire", shadowWcard: 16, MinW: 100, IdW: 100, MaxW: .infinity, MinH: 100, IdH: 100, MaxH: .infinity)
                    }
                    .fullScreenCover(isPresented: $isShowingSheetA, onDismiss: didDismiss) {
                        ZStack {
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack {
                                    LearningInspiration()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            Button(action: { isShowingSheetA.toggle() }) {
//                                Image(systemName: "xmark.circle.fill")
//                                    .font(.system(size: 32))
//                                    .foregroundColor(.gray)
                                Text("DONE")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(30)
                            .buttonStyle(.bordered)
                        }
                    }
                    //END PAGE-1
                    //PAGE-2
                    Button(action:
                            {
                        isShowingSheetB.toggle()
                        //                        wttsprogresscompleted2()
                        gameLevelData.wttsUnlock2()
                    })
                    {
                        VStack {
                            WideCardView(titleWcard: titleWcardList[1], iconWcard: "", Wcardimage: "whatcard_origin", shadowWcard: 16, MinW: 100, IdW: 100, MaxW: .infinity, MinH: 100, IdH: 100, MaxH: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .fullScreenCover(isPresented: $isShowingSheetB, onDismiss: didDismiss) {
                        ZStack {
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack {
                                    LearningOriginator()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            Button(action: { isShowingSheetB.toggle() }) {
//                                Image(systemName: "xmark.circle.fill")
//                                    .font(.system(size: 32))
//                                    .foregroundColor(.gray)
                                Text("DONE")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(30)
                            .buttonStyle(.bordered)
                        }
                    }
                }//END PAGE-2
                
                
                //LINE-2
                HStack(spacing: 20) {
                    
                    //PAGE-3
                    Button(action:
                            {
                        isShowingSheetC.toggle()
                        //                        wttsprogresscompleted3()
                        gameLevelData.wttsUnlock3()
                    })
                    {
                        VStack {
                            WideCardView(titleWcard: titleWcardList[2], iconWcard: "", Wcardimage: "whatcard_creator", shadowWcard: 16, MinW: 100, IdW: 100, MaxW: .infinity, MinH: 100, IdH: 100, MaxH: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .fullScreenCover(isPresented: $isShowingSheetC, onDismiss: didDismiss) {
                        ZStack {
                            ScrollView(.horizontal, showsIndicators: true) {
                                HStack {
                                    LearningOrigins()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            Button(action: { isShowingSheetC.toggle() }) {
//                                Image(systemName: "xmark.circle.fill")
//                                    .font(.system(size: 32))
//                                    .foregroundColor(.gray)
                                Text("DONE")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(30)
                            .buttonStyle(.bordered)
                        }
                    }//END PAGE-3
                    
                    //                    //PAGE-3
                    //                    Button(action:
                    //                    {
                    //                        isShowingSheetB.toggle()
                    ////                        wttsprogresscompleted4()
                    //                        gameLevelData.wttsUnlock4()
                    //                    })
                    //                    {
                    //                        VStack {
                    //                            WideCardView(titleWcard: titleWcardList[3], iconWcard: "", Wcardimage: "Art-4", shadowWcard: 16, MinW: 100, IdW: 100, MaxW: .infinity, MinH: 100, IdH: 100, MaxH: .infinity)
                    //                        }
                    //                        .buttonStyle(.borderedProminent)
                    //                    }
                    //                    .sheet(isPresented: $isShowingSheetB, onDismiss: didDismiss) {
                    //                        Button(action: { isShowingSheetB.toggle() }) {
                    //                            Text("Dismiss")
                    //                        }
                    //                        .buttonStyle(.bordered)
                    //                    }//END PAGE-3
                }
            }
            .padding(40)
            //            .border(.red)
        }
        
    }
    func wttsprogresscompleted1() {
        if (gameLevelData.wttsCard1 == false) {
            gameLevelData.wttsProgress += 1
        }
    }
    func wttsprogresscompleted2() {
        if (gameLevelData.wttsCard2 == false) {
            gameLevelData.wttsProgress += 1
        }
    }
    func wttsprogresscompleted3() {
        if (gameLevelData.wttsCard3 == false) {
            gameLevelData.wttsProgress += 1
        }
    }
    //    func wttsprogresscompleted4() {
    //        if (gameLevelData.wttsCard4 == false) {
    //            gameLevelData.wttsProgress += 1
    //        }
    //    }
}


struct WhatThaiToneScene_Previews: PreviewProvider {
    static var previews: some View {
        WhatThaiToneScene()
            .environmentObject(GameLevelData())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
