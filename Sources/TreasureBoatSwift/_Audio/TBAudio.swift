//
//  TBAudio.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/13.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

public struct TBAudio {
    
    public static func playClick() {
        playMP3(soundInModule: "sound-click")
    }

    public static func playDing() {
        playMP3(soundInModule: "sound-ding")
    }

    // MARK: - Helpers

    public static func playMP3(sound: String) {
        playSound(sound: sound, type: "mp3")
    }
    
    public static func playM4A(sound: String) {
        playSound(sound: sound, type: "m4a")
    }
    
    public static func playSound(sound: String, type: String) {
        guard let path = Bundle.main.path(forResource: sound, ofType: type) else {
            print("can't find the audio file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
    
    public static func stop() {
        audioPlayer?.stop()
    }
    
    // MARK: - Framework Internal
    
    fileprivate static func playSound(soundInModule: String, type: String) {
        guard let path = Bundle.module.path(forResource: soundInModule, ofType: type) else {
            print("can't find the audio file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }

    
    fileprivate static func playMP3(soundInModule: String) {
        playSound(soundInModule: soundInModule, type: "mp3")
    }
    
    fileprivate static func playM4A(soundInModule: String) {
        playSound(soundInModule: soundInModule, type: "m4a")
    }
    
    
}
