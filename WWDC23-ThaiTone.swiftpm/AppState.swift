//
//  AppState.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 6/3/2566 BE.
//

import Foundation
import SwiftUI

class GameLevelData: ObservableObject {
    
    @State var GameLevelData: Int = UserDefaults.standard.integer(forKey: "GameLevel")
    
    @Published var GameLevel: Int = UserDefaults.standard.integer(forKey: "GameLevel")
    @Published var GameProgressView: Double = 0.0
    @Published var GameTest: Int = 10
    @Published var End: Bool = false
    
    @Published var wttsProgress = 0

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
            print("gameLevelProgressCurrent:\(gameLevelProgressCurrent)")
            UserDefaults.standard.set(gameLevelProgressCurrent, forKey: "gameLevelCurrent")
        }
    }
    
    @Published var GameProgress: Double = 0.0 {
        didSet {
            print("\(GameProgress)")
            UserDefaults.standard.set(GameProgress, forKey: "gameProgressCurrent")
        }
    }
    
    func unlocklevel() {
        GameLevel += 1
        gameLevelProgressCurrent = GameLevel
        print("\(GameLevel)/GameLevel")
        gameprogress()
    }
    
    func gameprogress() {
        GameProgress += 0.25
        GameProgressView = GameProgress*100
        print("\(GameProgress)/GameProgressView")
        print("\(End)/EndView")
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
    }
    
    //FUNC to check WelcomeView it's show only on first time and store user data
    func dataWelcomeViewToggle() {
        if (FirstWelcomeView == true) {
            dataWelcomeView = false
            print("\(dataWelcomeView) :dataWelcomeView")
            UserDefaults.standard.set(dataWelcomeView, forKey: "datawelcomeview")
        }
    }
    
}


