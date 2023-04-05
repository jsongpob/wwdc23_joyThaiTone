//
//  AppState.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 6/3/2566 BE.
//

import Foundation
import SwiftUI

class GameLevelData: ObservableObject {
    @Published var endTabUnlock: Bool = UserDefaults.standard.bool(forKey: "endTablUnlock") {
        didSet {
            if (endTabUnlock == true && GameLevel == 3) {
                GameLevel += 1
            }
            UserDefaults.standard.set(endTabUnlock, forKey: "endTablUnlock")
            print("endTabUnlock data changed")
        }
    }
    
    @Published var EndOneTime = false {
        didSet {
            print("EndOneTime = \(EndOneTime)")
        }
    }
    
    @State var GameLevelData: Int = UserDefaults.standard.integer(forKey: "GameLevel")
//    @ObservedObject var wttsstate = wttsState()
    
    @Published var GameProgressView: Double = 0.0
    @Published var GameTest: Int = 10
    @Published var End: Bool = false

//    public init() {
//        GameLevel = UserDefaults.standard.integer(forKey: "gameLevelCurrent")
//        GameProgress = UserDefaults.standard.double(forKey: "gameProgressCurrent")
//        GameProgressView = 0.00
//        End = false
//        WelcomeView = false
//        gameLevelProgressCurrent = UserDefaults.standard.integer(forKey: "gameLevelCurrent")
//        wttsProgress = 0
//    }
    
//    init() {
//        FirstWelcomeView = true
//    }
    @Published var GameLevel: Int = UserDefaults.standard.integer(forKey: "GameLevel") {
        didSet {
            UserDefaults.standard.set(GameLevel, forKey: "GameLevel")
            if (GameLevel >= 4) {
                endTabUnlock = true
            }
        }
    }
    
    @Published var wttsProgress = UserDefaults.standard.integer(forKey: "wttsProgress") {
        didSet {
            UserDefaults.standard.set(wttsProgress, forKey: "wttsProgress")
            
            if (wttsProgress == 3) {
                unlocklevel()
//                print("\(wttsProgress) :wttsProgress")
            } else if (wttsProgress >= 4) {
                wttsProgress = 3
            }
        }
    }
    
    @Published var FirstWelcomeView: Bool = UserDefaults.standard.bool(forKey: "datawelcomeview") {
        didSet {
            print("FirstWelcomeView bool changed")
            UserDefaults.standard.set(FirstWelcomeView, forKey: "datawelcomeview")
        }
    }
    
    @Published var dataWelcomeView: Bool = true {
        didSet {
            print("dataWelcomeView data changed")
        }
    }
    
    @Published var gameLevelProgressCurrent: Int = 0 {
        didSet {
//            print("gameLevelProgressCurrent:\(gameLevelProgressCurrent)")
            UserDefaults.standard.set(gameLevelProgressCurrent, forKey: "gameLevelCurrent")
        }
    }
    
    @Published var GameProgress: Double = 0.0 {
        didSet {
//            print("\(GameProgress)")
            UserDefaults.standard.set(GameProgress, forKey: "gameProgressCurrent")
        }
    }
    
    func unlocklevel() {
        GameLevel += 1
        gameLevelProgressCurrent = GameLevel
//        print("\(GameLevel)/GameLevel")
        gameprogress()
    }
    
    func gameprogress() {
        GameProgress += 0.25
        GameProgressView = GameProgress*100
//        print("\(GameProgress)/GameProgressView")
//        print("\(End)/EndView")
        if (GameLevel >= 4) {
            End = true
        } else {
            End = false
        }
        return
    }
    
    func gamereset() {
        GameLevel = 0
        GameProgress = 0.0
        wttsProgress = 0
        FirstWelcomeView = true
        wttsResetUnlock()
        endTabUnlock = false
        wttscompleted = false
        colorBookSelect = 0
        TTcolorcompleted = false
        EndOneTime = false
    }
    
    //FUNC to check WelcomeView it's show only on first time and store user data
    func dataWelcomeViewToggle() {
        if (FirstWelcomeView == true) {
            dataWelcomeView = false
            GameLevel = 1
//            print("\(dataWelcomeView) :dataWelcomeView")
            UserDefaults.standard.set(dataWelcomeView, forKey: "datawelcomeview")
            UserDefaults.standard.set(GameLevel, forKey: "GameLevel")
        }
    }
    
    @Published var wttsUnlockLevel: Int = 0 {
        didSet {
//            print("\(wttsUnlockLevel)")
            UserDefaults.standard.set(wttsUnlockLevel, forKey: "wttsUnlockLevelData")
            if (wttsUnlockLevel >= 3) {
//                wttscompleted = true
//                print("wttscompleted: \(wttscompleted)")
            }
        }
    }
    
    @Published var wttscompleted = UserDefaults.standard.bool(forKey: "wttscompleted") {
        didSet {
            UserDefaults.standard.set(wttscompleted, forKey: "wttscompleted")
            if (wttscompleted == true) {
                unlocklevel()
//                print("wttscompleted == true")
            }
        }
    }

    @Published var wttsUnlockLevelState: Int = UserDefaults.standard.integer(forKey: "wttsUnlockLevelData")
    
    @Published var wttsCard1: Bool = UserDefaults.standard.bool(forKey: "wttsCard1") {
        didSet {
            UserDefaults.standard.set(wttsCard1, forKey: "wttsCard1")
//            print("wttsCard1: \(wttsCard1)")
        }
    }
    //
    @Published var wttsCard2: Bool = UserDefaults.standard.bool(forKey: "wttsCard2") {
        didSet {
            UserDefaults.standard.set(wttsCard1, forKey: "wttsCard2")
//            print("wttsCard2: \(wttsCard2)")
        }
    }
    //
    @Published var wttsCard3: Bool = UserDefaults.standard.bool(forKey: "wttsCard3") {
        didSet {
            UserDefaults.standard.set(wttsCard1, forKey: "wttsCard3")
//            print("wttsCard3: \(wttsCard3)")
        }
    }
    //
//    @Published var wttsCard4: Bool = UserDefaults.standard.bool(forKey: "wttsCard4") {
//        didSet {
//            UserDefaults.standard.set(wttsCard1, forKey: "wttsCard4")
////            print("wttsCard4: \(wttsCard4)")
//        }
//    }
    //
    @Published var wttsprogresscompleted: Int = 0
    
    @Published var wttsData = 0
    
    func wttsResetUnlock() {
        wttsCard1 = false
        wttsCard2 = false
        wttsCard3 = false
//        wttsCard4 = false
    }
    
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
//    func wttsUnlock4() {
//        if (wttsCard4 == false) {
//            wttsUnlockLevel += 1
//            wttsCard4 = true
//        }
//    }
    
    var TTcolorcompleted = UserDefaults.standard.bool(forKey: "TTcolorcompleted") {
        didSet {
            UserDefaults.standard.set(TTcolorcompleted, forKey: "TTcolorcompleted")
        }
    }
    @Published var colorBookSelect: Int = UserDefaults.standard.integer(forKey: "colorBookSelect") {
        didSet {
            UserDefaults.standard.set(colorBookSelect, forKey: "colorBookSelect")
//            if (colorBookSelect == 5) {
//                unlocklevel()
//            }
//            print("colorBookSelect data changed")
            print(colorBookSelect)
            print(TTcolorcompleted)
        }
    }
    
}

