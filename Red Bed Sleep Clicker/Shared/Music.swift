//
//  Music.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 04.03.2024.
//

import AVFoundation

final class Music {
    static let shared = Music()
    static var player: AVAudioPlayer?
    
    private init() { }
    
    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "1-08. Minecraft", ofType: "mp3") {
            let backgroundMusicUrl = URL(fileURLWithPath: bundle)
            do {
                Music.player = try AVAudioPlayer(contentsOf: backgroundMusicUrl)
                guard let audioPlayer = Music.player else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                return
            }
        }
    }
}
