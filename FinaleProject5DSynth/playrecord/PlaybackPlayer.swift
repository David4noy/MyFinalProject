//
//  PlaybackPlayer.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 12/08/2021.
//

import Foundation
import AudioKit
import AudioKitEX
import AVFoundation

class PlaybackPlayer{
    
    let playback:AudioPlayer
    var audioFolderUrl:URL? = nil
    var playbackIsPlaying:Bool = false
        
    var currentTime:TimeInterval = 0
    
    init() {
        
        playback = AudioPlayer()
        
        playback.play()
        playback.stop()
        addPlaybackFile()
    }
    
    
    func playPlayback(){
        playback.play(from: currentTime)
    }
    
    func pausePlayback(){
        
        playback.pause()
        currentTime = playback.getCurrentTime()
    }
    
    func stopPlayback(){
        playback.play()
        playback.stop()
        currentTime = 0
    }
    
    func addPlaybackFile(){
        
        guard let url = Bundle.main.url(forResource: "Away - Patrick Patrikios", withExtension: "mp3") else {
            print("*******failed to load Away - Patrick Patrikios******")
            return}

        do {
            try playback.load(url: url)
        } catch  {
            print(error)
        }
    }
    
}

//
//enum StateMod: String {
//    case looping = "looping"
//    case paused = "paused"
//    case playing = "playing"
//    case stopped = "stoped"
//    case seeking = "seeking"
//    case reversing = "reversing"
//    case buffering = "buffering"
//    case scheduled = "scheduled"
//}
