//
//  FindGameState.swift
//  WWDC23-ThaiTone
//
//  Created by Songpob Hamthanan on 29/3/2566 BE.
//

import Foundation
import SwiftUI

class GameState: ObservableObject {
    
    @Published var gameIsNormalModeShowing = false
    @Published var gameIsHardModeShowing = false
    @Published var gameIsEndLessModeShowing = false
    @Published var isModeSelectShowingSheet = false
    @Published var isEndGameViewShowingSheet = false
    @Published var isShowName = true
    
    //INGAMES
    
    //NORMAL
    func NormalModeStart() {
        gameTimer()
        gameTotalTimerCountDown = 30.0
        gameTimerCountDown = 30.0
        isShowName = true
        Sounds.playInGame(sound: "mixkit-game-level-music", type: "mp3")
    }
    func inGameNormalMode() {
        //print(gameState.getColorName(for: gameState.hexCode))
        //print("\(collection.name)")
        //print("+1")
        Sounds.play(sound: "mixkit-game-flute-bonus", type: "mp3")
//        getNewColorsRounds()
        getNewColorsRoundsTest()
        randomColors()
        currentRounds += 1
//        if (gameTimerCountDown < gameTotalTimerCountDown-2) {
//            gameTimerCountDown += 2
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation {
                self.backgroundColors = Color.white
            }
        }
    }
    func inGameNormalModeFail() {
        if (gameTimerCountDown >= 0)
        {
            currentFail += 1
//            gameTimerCountDown -= 2
            Sounds.play(sound: "mixkit-video-game-power-up", type: "mp3")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    self.backgroundColors = Color.white
                }
            }
        }
    }
    
    //HARD
    func HardModeStart() {
        gameTimer()
        gameTotalTimerCountDown = 30.0
        gameTimerCountDown = 30.0
        isShowName = false
        Sounds.playInGame(sound: "mixkit-game-level-music", type: "mp3")
    }
    func inGameHardMode() {
        Sounds.play(sound: "mixkit-game-flute-bonus", type: "mp3")
//        getNewColorsRounds()
        getNewColorsRoundsTest()
        randomColors()
        currentRounds += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation {
                self.backgroundColors = Color.white
            }
        }
    }
    func inGameHardModeFail() {
        if (gameTimerCountDown >= 0)
        {
            currentFail += 1
            Sounds.play(sound: "mixkit-video-game-power-up", type: "mp3")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    self.backgroundColors = Color.white
                }
            }
        }
    }
    
    //ENDLESS
    func EndLessModeStart() {
        gameTimer()
        gameTotalTimerCountDown = 10.0
        gameTimerCountDown = 10.0
        bonusTime = 0
        isShowName = false
        Sounds.playInGame(sound: "mixkit-game-level-music", type: "mp3")
    }
    func inGameEndLessMode() {
        Sounds.play(sound: "mixkit-game-flute-bonus", type: "mp3")
//        getNewColorsRounds()
        getNewColorsRoundsTest()
        randomColors()
        currentRounds += 1
        if (gameTimerCountDown < gameTotalTimerCountDown-2) {
            gameTimerCountDown += 2
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation {
                self.backgroundColors = Color.white
            }
        }
    }
    func inGameEndLessModeFail() {
        if (gameTimerCountDown >= 0)
        {
//            currentFail += 1
            gameTimerCountDown -= 2
            Sounds.play(sound: "mixkit-video-game-power-up", type: "mp3")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    self.backgroundColors = Color.white
                }
            }
        }
    }
    func isbonusTime() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                    self.bonusTime = 0
            }
        }
    }
    
    
    //COUNTDOWN
    @Published var countDownTimer = 8 {
        didSet {
            if (countDownTimer == -1)
            {
                gameStarted = true
            }
        }
    }
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    //FUNCTION COUNTDOWN
    func startCountDown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if (self.countDownTimer >= 0)
            {
                self.countDownTimer -= 1
            }
            else
            {
                timer.invalidate()
            }
        }
    }
    //END FUNCTION COUNTDOWN
    
    //GAME RESET
    func gameReset() {
        if ((Sounds.audioPlayerInGame) != nil) {
            Sounds.audioPlayerInGame.stop()
        }
        countDownTimer = 8
        maxCurrentRounds = 10
        bonusTime = 0
        gameStarted = false
        gameMode = 0
        gameTimerStop()
        Endgame = false
        currentFail = 0
    }
    
    @Published var cancelGameDisable = false
    func cancelGame() {
        cancelGameDisable = false
    }
    
    //GAMEPLAY
    @Published var gameStarted = false
    @Published var gameMode = 0
    
    //GAME-STARTING SETUP
    
    //NORMAL MODE
    @Published var Rounds = 0
    @Published var currentRounds = 0
    @Published var currentFail = 0 {
        didSet {
            print("currentFail = \(currentFail)")
            if (currentFail >= 6)
            {
                currentFail = 0
                gameFail = true
                gameTimerCountDown = 0
            }
        }
    }
    @Published var gameFail = false {
        didSet {
            print("gameFail = \(gameFail)")
        }
    }
    
    //ENDLESS MODE
    @Published var bonusTime = 0
    
    //GAME-TIMER
    @Published var gameTotalTimerCountDown: Float = 30.0
    @Published var gameTimerCountDown: Float = 30.0 {
        didSet {
            print("gameTimerCountDown = \(gameTimerCountDown)/\(gameTotalTimerCountDown)")
//            print("maxCurrentRounds = \(maxCurrentRounds)")
            if (gameTimerCountDown == -1)
            {
                Endgame = true
                cancelGameDisable = false
                isEndGameViewShowingSheet = true
                gameIsNormalModeShowing = false
                isModeSelectShowingSheet = false
                gameReset()
                gameTimerCountDown = 0
            }
            else if (gameTimerCountDown == 0)
            {
                Endgame = true
                cancelGameDisable = false
                isEndGameViewShowingSheet = true
                gameIsNormalModeShowing = false
                isModeSelectShowingSheet = false
                gameReset()
            }
        }
    }
    @State private var gametimer: Timer?
    
    func gameTimer() {
        gametimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { gametimer in
            if (self.gameTimerCountDown > 0)
            {
                self.gameTimerCountDown -= 1
            }
            else
            {
                gametimer.invalidate()
            }
        }
    }
    func gameTimerStop() {
        gametimer?.invalidate()
        gametimer = nil
    }
    
    //END GAME SETUP
    @Published var Endgame = false
    
    //COLORS COLLECTION
    @State var colors: [(name: String, hex: String)] = [
        ("Dangchad", "#c9242b"),
        ("Hongchad", "#cb6669"),
        ("Dindang", "#984c36"),
        ("Dindangthat", "#98262a"),
        ("Dindangtut", "#76202a"),
        ("Dandtut", "#951519"),
        ("Hongdintut", "#894c3e"),
        ("Hongdin", "#d59088"),
        ("Hongsabat", "#df92a3"),
        ("Fhundang", "#df92a3"),
        ("Kampoolud", "#dc4028"),
        ("Buaroi", "#ca6a7a"),
        ("Tongsingha", "#dc577e"),
        ("Dokubon", "#dd6d91"),
        ("Dangdokkamut", "#d6999e"),
        ("Linchi", "#a62b4c"),
        ("Dangdokchaba", "#a62b4c"),
        ("Namkruang", "#dc403e"),
        ("Dangyo", "#c93b5e"),
        ("Kanpooasura", "#d35425"),
        ("Dokbanyen", "#f27091"),
        ("Nammak", "#a13422"),
        ("Kulap", "#f698a3"),
        ("Gasornchompoo", "#db3b7b"),
        ("Dangmanee", "#ca3c3d"),
        ("Nilubon", "#ac83a8"),
        ("Sen", "#f25821"),
        ("Hongsen", "#f58465"),
        ("Lukpikul", "#dc4c33"),
        ("Meksonthaya", "#f68b32"),
        ("Kandokkannika", "#d14c28"),
        ("Phuakanee", "#e09179"),
        ("Maksuk", "#f36e31"),
        ("Doktaptim", "#dd5734"),
        ("Nampueang", "#d77c29"),
        ("Momai", "#e3a377"),
        ("Rongtong", "#e8bb1f"),
        ("Horadan", "#ffde2c"),
        ("Pleangkaophot", "#F2D980"),
        ("Lueamprapasson", "#cec9a2"),
        ("Chan", "#f4d25d"),
        ("Champa", "#eea31f"),
        ("Lueangdin", "#be9c25"),
        ("Dokbuab", "#ffe95e"),
        ("Maikritsana", "#e5be82"),
        ("Lueangpai", "#ead415"),
        ("Lukkchan", "#f2c04e"),
        ("Muksuk", "#c7ae7b"),
        ("Kipueang", "#d09b2a"),
        ("Nuea", "#f1d7b3"),
        ("Matumsuk", "#d88529"),
        ("Khiaopai", "#687840"),
        ("Khiaotangsae", "#45ab87"),
        ("Khiaokitthong", "#00796e"),
        ("Khiaokheemaha", "#6b6b3e"),
        ("Khiaokab", "#00676e"),
        ("Khiaokantong", "#269a82"),
        ("Khiaonuan", "#58986f"),
        ("Khiaokampoo", "#17372a"),
        ("Khiaodin", "#356740"),
        ("Khiaokaikrud", "#00968f"),
        ("Tongon", "#919b4a"),
        ("Khiaotong", "#21723e"),
        ("Khiaokagi", "#008068"),
        ("Khiaobaikae", "#145139"),
        ("Khiaomali", "#69b496"),
        ("Khiaokaiga", "#93b692"),
        ("Maipai", "#278766"),
        ("Khiaotua", "#6d953a"),
        ("Khiaonokkaling", "#88ab68"),
        ("Khiaothapoon", "#5192a1"),
        ("Khiaokinokkarawek", "#7dbfb8"),
        ("Mahadthai", "#657249"),
        ("Khiaonamlai", "#00968f"),
        ("Yhaphangon", "#dcd990"),
        ("Morakod", "#009058"),
        ("Khiaomaphood", "#bcb531"),
        ("Sork", "#84c299"),
        ("Khaioronfga", "#5f8d56"),
        ("Khram", "#16466e"),
        ("Khramfarang", "#0c4da2"),
        ("Mokhram", "#577896"),
        ("Mekkhram", "#072f4f"),
        ("Mek", "#93adbd"),
        ("Thaegung", "#296169"),
        ("Khap", "#1a465a"),
        ("Khapdam", "#042738"),
        ("Kemkhap", "#005465"),
        ("Namlai", "#5aaebd"),
        ("Koncornangnokyung", "#008d9b"),
        ("Kelahum", "#2a0139"),
        ("Tamaw", "#4d94ac"),
        ("Kromtha", "#1b2c55"),
        ("Namngennokpilap", "#0f697c"),
        ("Fa", "#3476ae"),
        ("Muangchad", "#a5546a"),
        ("Muangkhram", "#3a2d53"),
        ("Muangmedmaprang", "#702c7d"),
        ("Muangdoktabeak", "#b579a6"),
        ("Muangdokpaktop", "#776fa5"),
        ("Muangkhiao", "#7f616d"),
        ("Muangkae", "#432a64"),
        ("Dokunchan", "#695095"),
        ("Pueak", "#bd9dc2"),
        ("Muangtong", "#9f4a57"),
        ("Plueagmankut", "#6e2c4f"),
        ("Pueangangkap", "#876aa4"),
        ("Lukwa", "#400643"),
        ("Namtan", "#7b4a34"),
        ("Namtanmai", "#522e1a"),
        ("Kapi", "#a5505b"),
        ("Fhad", "#6f2e28"),
        ("Fang", "#daba8a"),
        ("Din", "#e3a377"),
        ("It", "#c1621a"),
        ("Sak", "#b95831"),
        ("Kruk", "#8a5929"),
        ("Kaki", "#a19078"),
        ("Thong", "#d1b654"),
        ("Thongkam", "#bd9425"),
        ("Thongchomphunuch", "#dba73b"),
        ("Thongdokbuab", "#ddc153"),
        ("Lueangpeangthong", "#c0ac23"),
        ("Thongdang", "#a0564b"),
        ("Thongdangsuk", "#d68f71"),
        ("Nak", "#cb7371"),
        ("Lueamphai", "#e3c0ab"),
        ("Lueamlueang", "#e7d992"),
        ("Ngen", "#bcc4c1"),
        ("Kaoponpet", "#e5dbc0"),
        ("Lek", "#bcbdb8"),
        ("Leklai", "#29241b"),
        ("Samritphon", "#613f1c"),
        ("Samritchok", "#5c4606"),
        ("Samritsak", "#a1966d"),
        ("Samritkhun", "#165d5a"),
        ("Samritdat", "#444740"),
        ("Damkhamao", "#000000"),
        ("Dammuek", "#5a5b60"),
        ("Momuek", "#778a83"),
        ("Muekchin", "#363c41"),
        ("Namrak", "#2b1c18"),
        ("Samrit", "#584e42"),
        ("Peekka", "#364540"),
        ("Khamaoyang", "#223640"),
        ("Tao", "#7f8585"),
        ("Lueangtao", "#b4a790"),
        ("Swad", "#6a6e78"),
        ("Khiaonil", "#002835"),
        ("Nilkan", "#00080b"),
        ("Doklao", "#b3b3ba"),
        ("Lukhan", "#6b6272"),
        ("Kwanpheng", "#9d9081"),
        ("Poon", "#9fa49f"),
        ("Toakhiao", "#93a9a4"),
        ("Khaphong", "#f1ede2"),
        ("Khaokabang", "#d0cfcf"),
        ("Falap", "#efdae0"),
        ("Kwaaipueag", "#efc5b5"),
        ("Changpueag", "#e09a83"),
        ("Keabbua", "#edbbc6"),
        ("Nuantao", "#b4ae9b"),
        ("Nuan", "#dbcc90"),
        ("Nuanchan", "#dcc169"),
        ("Sang", "#fff1d0"),
        ("Khaokhap", "#c1d4ce"),
        ("Ngachang", "#fffde0"),
        ("Mok", "#dbccb9")]
    
    func getColorName(for hexCode: String) -> String {
        if let color = selectedColorsCollection.first(where: { $0.hex == hexCode })
        {
            return color.name
        }
        else
        {
            return ""
        }
    }
    
    @Published var ProgressColor = Color.clear
    @Published var randomColor = Color.clear
    @Published var hexCode = ""
    @Published var backgroundColors = Color.clear
    @Published var selectedColorsCollection = [(name: String, hex: String)]()
    
    func randomColors() {
        selectedColorsCollection = self.selectedColorsCollection.shuffled()
        let randomIndex = Int.random(in: 0..<selectedColorsCollection.capacity)
        randomColor = Color(hex: selectedColorsCollection[randomIndex].hex)
        hexCode = selectedColorsCollection[randomIndex].hex
    }
    
    func getColors() {
        NormalCheck()
        EndlessCheck()
        selectedColorsCollection = Array(colors.shuffled()[..<30]).sorted(by: { $0.hex < $1.hex })
    }
    
    func NormalCheck() {
        if (gameMode == 1 && gameTimerCountDown < gameTotalTimerCountDown-2) {
            gameTimerCountDown += 5
        }
    }
    
    func EndlessCheck() {
        if (gameMode == 3 && gameTimerCountDown < gameTotalTimerCountDown-2) {
            gameTimerCountDown = gameTotalTimerCountDown
            if (bonusTime == 0) {
                bonusTime = 1
            }
        }
    }
    
//    func getNewColorsRounds() {
//        if (currentRounds == 10) {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 20)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 30)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 40)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 50)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 60)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 70)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 80)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//        else if (currentRounds == 90)
//        {
//            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
//            getColors()
//        }
//    }
    
    var maxCurrentRounds = 10
    
    func getNewColorsRoundsTest() {
        if (currentRounds == maxCurrentRounds) {
            Sounds.play(sound: "mixkit-arcade-bonus-alert", type: "mp3")
            maxCurrentRounds += 10
            print("maxCurrentRounds: \(maxCurrentRounds)")
            getColors()
        }
    }
    
    //ORIRENTATION CHECK
    @State var orientation = UIDeviceOrientation.unknown

    
}