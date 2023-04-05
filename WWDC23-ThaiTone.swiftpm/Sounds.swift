import AVFoundation

var audioPlayer: AVAudioPlayer?

class Sounds {
    static var audioPlayer: AVAudioPlayer!
    static var audioPlayerInGame: AVAudioPlayer!

    static func play(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
           do {
               _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayer?.volume = 0.3
               audioPlayer?.play()
           } catch {
               print("Error playing sound")
           }
        }
    }
    
    static func playInGame(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
           do {
               _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default, options: .mixWithOthers)
               audioPlayerInGame = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayerInGame?.volume = 0.3
               audioPlayerInGame.numberOfLoops = -1
               audioPlayerInGame?.play()
           } catch {
               print("Error playing sound")
           }
        }
    }
}
