//
//  PlaybackPlayer.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 12/08/2021.
//

import UIKit
import AudioKit
import AudioKitEX
import AVFoundation

struct PlayerFile: Identifiable, Hashable {
    let id = UUID()
    let url: URL
    let name: String
}

class PlaybackPlayer: NSObject{
    
    let playback = AudioPlayer()
    var audioFolderUrl:URL? = nil
    var playbackIsPlaying:Bool = false
    let manager = FileManager.default
    var url:URL?
    var audioFolder:URL!
    var currentTime:TimeInterval = 0
    var audioFileList = [PlayerFile]()
    var loadFileMod:LoadFileMod = .load
    
    override init() {
        super.init()
        
        
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        audioFolder = url.appendingPathComponent("Audio")
        
        do {
            try manager.createDirectory(at: audioFolder, withIntermediateDirectories: true, attributes: [:])
        } catch  {
            Log(error)
            print(error)
        }
        
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
    
    func loadFile(url: URL){
        addPlaybackFile(url: url)
    }
    
    func addPlaybackFile(url: URL){
        //
        //        guard let fileURL = Bundle.main.url(forResource: "Away - Patrick Patrikios", withExtension: "mp3") else {
        //            print("*******failed to load Away - Patrick Patrikios******")
        //            return}
        
//        guard let fileURL = url else {
//            return}
//        print(fileURL)
        
        do {
            try playback.load(url: url)
        } catch  {
            print(error)
        }
    }
    
    func addToPlaylist(playerFile: PlayerFile){
        audioFileList.append(playerFile)
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
