//
//  MainAudioMixer.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 09/08/2021.
//

import Foundation
import AudioKit
import AudioKitEX

class MainAudioMixer{
    
    let engine = AudioEngine()
    let engineMixer:Mixer
    
    let recorder:AudioRecorder
    let recorderSynthFader:Fader
    let recorderPlaybackFader:Fader
    let recorderMixer:Mixer
    let recorderFader:Fader
    let recorderToEngine:Fader
    
    let playback:AudioPlayer
    let playbackFader:Fader
    var audioFolderUrl:URL? = nil
    var playbackIsPlaying:Bool = false
    
    let mySynth = Synth.shared
    
    init() {
        
        playback = AudioPlayer()
        playbackFader = Fader(playback, gain: 0.5)
        
        recorderPlaybackFader = Fader(playback, gain: 1)
        recorderSynthFader = Fader(mySynth.synthFader, gain: 1)
        recorderMixer = Mixer([recorderSynthFader,recorderSynthFader])
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
        addPlaybackFile()
    }
    
    
    func loadAudioFolderUrl(){
        let manager = FileManager.default
        guard let url = manager.urls(for: .musicDirectory, in: .userDomainMask).first else {return}
        let audioUrl = url.appendingPathComponent("Audio")
        
        do {
            try manager.createDirectory(at: audioUrl, withIntermediateDirectories: true, attributes: [:])
        } catch  {
            Log(error)
            print(error)
        }
        audioFolderUrl = audioUrl
    }
    
    
    func playPausePlayback(){
        
        if playback.isPlaying{
            playback.pause()
        } else {
            playback.play()
        }
        
        playbackIsPlaying = playback.isPlaying
    }
    
    func stopPlayback(){
        playback.stop()
    }
    
    func addPlaybackFile(){
        
        guard let url = Bundle.main.url(forResource: "Away - Patrick Patrikios", withExtension: "mp3") else {
            print("*******failed to load Away - Patrick Patrikios******")
            return}
        //        guard let url:URL = Bundle.main.resourceURL?.appendingPathComponent(
        //                            "Music/Audio/Away - Patrick Patrikios") else {
        //                        print("*******failed to load Away - Patrick Patrikios******")
        //            return}
        //
        do {
            try playback.load(url: url)
        } catch  {
            print(error)
        }
        
    }
    
    func toggleRecord(){
        
        let rand = Int.random(in: 0...1000)
        
        if recorder.isRecording{
            
        }
        recorder.setFileName("David \(rand)")
        recorder.toggleRecord()
    }
    
    
}
