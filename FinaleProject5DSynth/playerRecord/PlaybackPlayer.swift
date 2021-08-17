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
                
        addPlaybackFile()
        
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        audioFolder = url.appendingPathComponent("Audio")

        do {
            try manager.createDirectory(at: audioFolder, withIntermediateDirectories: true, attributes: [:])
        } catch  {
            Log(error)
            print(error)
        }

        do {
            let items = try manager.contentsOfDirectory(atPath: audioFolder.path)
            for item in items {
                                
                let supportedAudioFormats = [
                    "aac", "adts", "ac3", "aif",
                    "aiff", "aifc", "caf", "mp3",
                    "mp4", "m4a", "snd", "au", "sd2",
                    "wav"
                ]
                
                guard let file = URL(string: item) else {return}
                
                print(file)
                print("4/////////////////////////////////")

                if supportedAudioFormats.contains(file.pathExtension) {
                    
                    print("if/////////////////////////////////")

                    self.audioFileList.append(
                        PlayerFile(
                            url: file ,
                            name: file.deletingPathExtension().lastPathComponent
                        )
                    )
                    print("5/////////////////////////////////")
                }
                print("6/////////////////////////////////")
            }
        } catch  {
            print("7 error/////////////////////////////////")
            print("playList Error",error)
            print("/////////////////////////////////")
            print("/////////////////////////////////")
            print("/////////////////////////////////")

        }
        
        print("/////////////////////////////////")
        print("/////////////////////////////////")
        print("/////////////////////////////////")
        print(audioFileList)
        print("/////////////////////////////////")
        print("/////////////////////////////////")
        print("/////////////////////////////////")
        

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
//
//        guard let fileURL = Bundle.main.url(forResource: "Away - Patrick Patrikios", withExtension: "mp3") else {
//            print("*******failed to load Away - Patrick Patrikios******")
//            return}

        guard let fileURL = url else {
            return}
        print(fileURL)

        do {
            try playback.load(url: fileURL)
        } catch  {
            print(error)
        }
    }
    
    func loadFile(_ presentationController: UIViewController,loadFileMod:LoadFileMod){
        
        self.loadFileMod = loadFileMod
        
        let docomentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.aiff,UTType.mp3,UTType.wav,UTType.audio], asCopy: true)
        docomentPicker.delegate = self
        docomentPicker.allowsMultipleSelection = false
        presentationController.present(docomentPicker, animated: true, completion: nil)
    }

    
}

extension PlaybackPlayer: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let selectedFileURL = urls.first else {return}
        
        switch loadFileMod {
        
        case .load:
            url = selectedFileURL
             addPlaybackFile()
        case .copy:
            let sandboxFileURL = audioFolder.appendingPathComponent(selectedFileURL.lastPathComponent)
 
            if FileManager.default.fileExists(atPath: sandboxFileURL.path){
                print("Already Exists")
            } else {
                do {
                    try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                    print("Copied file")
                } catch  {
                    print("Error", error)
                }
            }
            
        case .addToPlaylist:
            self.audioFileList.append(
                PlayerFile(
                    url: selectedFileURL ,
                    name: selectedFileURL.deletingPathExtension().lastPathComponent
                )
            )
        }
        
        print(loadFileMod.rawValue)
   
    }

}

enum LoadFileMod: String{
    
    case load = "Loaded"
    case copy = "Copied to audio folder"
    case addToPlaylist = "File added to playlist"
    
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
