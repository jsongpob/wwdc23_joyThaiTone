//
//  WhatThaiToneScene.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 6/3/2566 BE.
//

import SwiftUI

struct WhatThaiToneScene: View {
    @EnvironmentObject var gameLevelData: GameLevelData
    
    @State var isShowingSheetA = false
    @State var isShowingSheetB = false
    @State var isShowingSheetC = false
    @State var isShowingSheetD = false
    
    @StateObject var wttsstate = wttsState()
    @StateObject var appstatedata = GameLevelData()
    
    @State var titleWcardList = ["What's ThaiTone", "Thai Inspiration", "Topic Name", "Thai Cultures"]
    
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
            
            VStack(spacing: 30) {
                Text("wttsUnlockLevel:\(wttsstate.wttsUnlockLevel) wttsTest:\(wttsstate.wttsUnlockLevelState) wttsprogress:\(gameLevelData.wttsProgress)")
                //LINE-1
                HStack(spacing: 30) {
                    
                    //PAGE-1
                    Button(action:
                    {
                        isShowingSheetA.toggle()
                        wttsprogresscompleted1()
                        wttsstate.wttsUnlock1()
                    })
                    {
                        WideCardView(titleWcard: titleWcardList[0], iconWcard: "", Wcardimage: "Art-1", shadowWcard: 16, Xcard: 450, Ycard: 320)
                    }
                    .sheet(isPresented: $isShowingSheetA, onDismiss: didDismiss) {
                        Button(action: { isShowingSheetA.toggle() }) {
                            Text("Dismiss")
                        }
                        .buttonStyle(.bordered)
                    }
                    //END PAGE-1
                    
                    //PAGE-2
                    Button(action:
                    {
                        isShowingSheetB.toggle()
                        wttsprogresscompleted2()
                        wttsstate.wttsUnlock2()
                    })
                    {
                        VStack {
                            WideCardView(titleWcard: titleWcardList[1], iconWcard: "", Wcardimage: "Art-2", shadowWcard: 16, Xcard: 620, Ycard: 320)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .sheet(isPresented: $isShowingSheetB, onDismiss: didDismiss) {
                        Button(action: { isShowingSheetB.toggle() }) {
                            Text("Dismiss")
                        }
                        .buttonStyle(.bordered)
                    }//END PAGE-2
                    
                }
                .frame(width: 1100, height: 320, alignment: .topLeading)
                
                //LINE-2
                HStack(spacing: 30) {
                    
                    //PAGE-3
                    Button(action:
                    {
                        isShowingSheetB.toggle()
                        wttsprogresscompleted3()
                        wttsstate.wttsUnlock3()
                    })
                    {
                        VStack {
                            WideCardView(titleWcard: titleWcardList[2], iconWcard: "", Wcardimage: "Art-3", shadowWcard: 16, Xcard: 550, Ycard: 200)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .sheet(isPresented: $isShowingSheetB, onDismiss: didDismiss) {
                        Button(action: { isShowingSheetB.toggle() }) {
                            Text("Dismiss")
                        }
                        .buttonStyle(.bordered)
                    }//END PAGE-3
                    
                    //PAGE-3
                    Button(action:
                    {
                        isShowingSheetB.toggle()
                        wttsprogresscompleted4()
                        wttsstate.wttsUnlock4()
                    })
                    {
                        VStack {
                            WideCardView(titleWcard: titleWcardList[3], iconWcard: "", Wcardimage: "Art-4", shadowWcard: 16, Xcard: 1040/2, Ycard: 200)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .sheet(isPresented: $isShowingSheetB, onDismiss: didDismiss) {
                        Button(action: { isShowingSheetB.toggle() }) {
                            Text("Dismiss")
                        }
                        .buttonStyle(.bordered)
                    }//END PAGE-3
                }
                .frame(width: 1100, height: 200, alignment: .topLeading)
                .scaledToFit()
            }
            .frame(width: 1100, alignment: .leading)
        }
    }
    func wttsprogresscompleted1() {
        if (wttsstate.wttsCard1 == false) {
            gameLevelData.wttsProgress += 1
        }
    }
    func wttsprogresscompleted2() {
        if (wttsstate.wttsCard2 == false) {
            gameLevelData.wttsProgress += 1
        }
    }
    func wttsprogresscompleted3() {
        if (wttsstate.wttsCard3 == false) {
            gameLevelData.wttsProgress += 1
        }
    }
    func wttsprogresscompleted4() {
        if (wttsstate.wttsCard4 == false) {
            gameLevelData.wttsProgress += 1
        }
    }
}


struct WhatThaiToneScene_Previews: PreviewProvider {
    static var previews: some View {
        WhatThaiToneScene()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

class wttsState: ObservableObject {
    
    @Published var wttsUnlockLevel: Int = 0 {
        didSet {
            print("\(wttsUnlockLevel)")
            UserDefaults.standard.set(wttsUnlockLevel, forKey: "wttsUnlockLevelData")
            if (wttsUnlockLevel >= 4) {
                wttsProgress = true
                print(wttsProgress)
            }
        }
    }
    
    init() {
        self.wttsProgress = false
    }

    @Published var wttsUnlockLevelState: Int = UserDefaults.standard.integer(forKey: "wttsUnlockLevelData")
    
    @Published var wttsProgress: Bool = false
    
    @Published var wttsCard1: Bool = false
    @Published var wttsCard2: Bool = false
    @Published var wttsCard3: Bool = false
    @Published var wttsCard4: Bool = false
    @Published var wttsprogresscompleted: Int = 0
    
    @Published var wttsData = 0
    
    func wttsUnlock1() {
        if (wttsCard1 == false) {
            wttsUnlockLevel += 1
            wttsCard1 = true
        }
    }
    func wttsUnlock2() {
        if (wttsCard2 == false) {
            wttsUnlockLevel += 1
            wttsCard2 = true
        }
    }
    func wttsUnlock3() {
        if (wttsCard3 == false) {
            wttsUnlockLevel += 1
            wttsCard3 = true
        }
    }
    func wttsUnlock4() {
        if (wttsCard4 == false) {
            wttsUnlockLevel += 1
            wttsCard4 = true
        }
    }

}
