//
//  MainAudioMixer.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 09/08/2021.
//

import UIKit
import AudioKit
import AudioKitEX
import AVFoundation

class MainAudioMixer{
    
    let engine = AudioEngine()
    let engineMixer:Mixer
    
    let recorder:AudioRecorder
    let recorderSynthFader:Fader
    let recorderPlaybackFader:Fader
    let recorderMixer:Mixer
    let recorderFader:Fader
    let recorderToEngine:Fader
    
    let playbackPlayer:PlaybackPlayer
    let playbackFader:Fader
    var audioFolderUrl:URL? = nil
    var playbackIsPlaying:Bool = false
        
    var currentTime:TimeInterval = 0
    
    let mySynth = Synth.shared
    
    init() {
        
        playbackPlayer = PlaybackPlayer()
        playbackFader = Fader(playbackPlayer.playback)
        
        recorderPlaybackFader = Fader(playbackPlayer.playback, gain: 1)
        recorderSynthFader = Fader(mySynth.synthFader, gain: 1)
        recorderMixer = Mixer([recorderSynthFader,recorderPlaybackFader])
        recorderFader = Fader(recorderMixer, gain: 0.5)
        recorderToEngine = Fader(recorderFader, gain: 0)
        
        engineMixer = Mixer([mySynth.synthFader,playbackFader,recorderToEngine])
        recorder = AudioRecorder(node: recorderFader)
        
        engine.output = engineMixer
        
        do {
            try engine.start()
            print("engine started")
        } catch {
            print(error, "Field")
        }

    }
    
    
    
    func setVolume(_ gain:AUValue){
        playbackFader.gain = gain
    }
    
    func playPlayback(){
        playbackPlayer.playPlayback()
    }
    
    func pausePlayback(){
        
        playbackPlayer.pausePlayback()
    }
    
    func stopPlayback(){
        playbackPlayer.stopPlayback()
    }
    
    func addPlaybackFile(){
        playbackPlayer.addPlaybackFile()
    }
    
    func loadFile(_ presentationController: UIViewController){
        playbackPlayer.loadFile(presentationController,loadFileMod: .load)
    }
    
    func copyFile(_ presentationController: UIViewController){
        playbackPlayer.loadFile(presentationController,loadFileMod: .copy)
    }
    
    func addToPlaylist(_ presentationController: UIViewController){
        playbackPlayer.loadFile(presentationController,loadFileMod: .addToPlaylist)
    }
    
    func toggleRecord(){
        
        let rand = Int.random(in: 0...1000)
        
        if recorder.isRecording{
            
        }
        recorder.setFileName("David \(rand)")
        recorder.toggleRecord()
    }
    
    
}


