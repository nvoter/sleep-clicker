//
//  Music.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 04.03.2024.
//

import AVFoundation

final class Music {
    static let shared = Music()
    private var player: AVAudioPlayer?
    
    private init() { }
    
    func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "1-08. Minecraft", ofType: "mp3") {
            let backgroundMusicUrl = URL(fileURLWithPath: bundle)
            do {
                player = try AVAudioPlayer(contentsOf: backgroundMusicUrl)
                guard let player = player else { return }
                if UserDefaults.standard.object(forKey: "volume level") != nil {
                    player.volume = UserDefaults.standard.float(forKey: "volume level")
                }
                player.numberOfLoops = -1
                player.prepareToPlay()
                player.play()
            } catch {
                return
            }
        }
    }
    
    func stopBackgroundMusic() {
        guard let player = player else { return }
        player.stop()
    }
    
    func changeVolume(value: Float) {
        guard let player = player else { return }
        player.volume = value
    }
    
    func startTNTSound() {
        if let bundle = Bundle.main.path(forResource: "minecraft-tnt-explosion-sound-effect-(hd)-made-with-Voicemod", ofType: "mp3") {
            let backgroundMusicUrl = URL(fileURLWithPath: bundle)
            do {
                player = try AVAudioPlayer(contentsOf: backgroundMusicUrl)
                guard let player = player else { return }
                if UserDefaults.standard.object(forKey: "volume level") != nil {
                    player.volume = UserDefaults.standard.float(forKey: "volume level")
                }
                player.play()
            } catch {
                return
            }
        }
    }
}
