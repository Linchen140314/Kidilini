//
//  SoundManager.swift
//  Kidsapp
//
//  Created by Jacqueline Kolbe on 30.09.24.
//

import Foundation
import AVFAudio
import UIKit

class SoundManager {
    static let instance = SoundManager()

    var player: AVAudioPlayer?

    func playSound(soundName: String) {
        if let asset = NSDataAsset(name: soundName) {
            do {
                player = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
                player?.volume = 1.0
                player?.play()
                print("Sound wird abgespielt")
            } catch let error {
                print("Fehler beim Abspielen des Sounds: \(error.localizedDescription)")
            }
        } else {
            print("Fehler: Datei nicht gefunden")
        }
    }
}

