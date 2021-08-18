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
    let engineMixer: Mixer
    
    let recorder: AudioRecorder
    let recorderSynthFader: Fader
    let recorderPlaybackFader: Fader
    let recorderMixer: Mixer
    let recorderFader: Fader
    let recorderToEngine: Fader
    var recorderGainValue: AUValue = 0
    
    let playbackPlayer: PlaybackPlayer
    let playbackFader: Fader
    var audioFolderUrl: URL? = nil
    var playbackIsPlaying: Bool = false
    
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

    
    // MARK: Playback Methods
    
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
    
    func loadFile(url: URL){
        playbackPlayer.loadFile(url: url)
    }
        
    func addToPlaylist(playerFile: PlayerFile){
        playbackPlayer.addToPlaylist(playerFile: playerFile)
    }
    
    // MARK: Recorder Methods
    
    func setRecordName(_ name: String? = nil){
        recorder.setRecordName(name)
    }
    
    func isRecordingPlayback(_ isRecording: Bool){
        if isRecording {
            recorderMixer.addInput(recorderPlaybackFader)
        } else {
            recorderMixer.removeInput(recorderPlaybackFader)
        }
    }
    
    func setRecordInputGain(_ gain: AUValue){
        recorderFader.gain = gain
    }
    
    func setRecordInputPlayerGain(_ gain: AUValue){
        recorderPlaybackFader.gain = gain
    }
    
    func setRecordInputSynthGain(_ gain: AUValue){
        recorderSynthFader.gain = gain
    }
    
    func toggleRecord(){
//        if recorder.isRecording {
//            recorderGainValue = recorderFader.gain
//            recorderFader.$leftGain.ramp(to: 0, duration: 0.3)
//            recorderFader.$leftGain.ramp(to: 0, duration: 0.3)
//            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 0.8) {
//                self.recorder.toggleRecord()
//                DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
//                    self.recorderFader.$leftGain.ramp(to: self.recorderGainValue, duration: 0.3)
//                    self.recorderFader.$leftGain.ramp(to: self.recorderGainValue, duration: 0.3)
//                }
//            }
//        } else {
//            recorder.toggleRecord()
//        }
        recorder.toggleRecord()
    }
    
    
    
//
//
//    func toggleRecordOrder()  {
//        volDown {
//            stopMutedRecording {
//                volUp {
//                    print("Finish")
//                }
//            }
//        }
//    }
//
//    // toggleRecord methods
//    func volDown(callback:() -> Void) {
//        if recorder.isRecording {
//            recorderGainValue = recorderFader.gain
//            recorderFader.gain = 0
//            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
//                self.recorder.toggleRecord()
//                DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
//                    self.recorderFader.gain = self.recorderGainValue
//                }
//            }
//            callback()
//        } else {
//            recorder.toggleRecord()
//        }
//    }
//
//    func stopMutedRecording(callback:() -> Void) {
//        recorder.toggleRecord()
//        callback()
//    }
//
//    func volUp(callback:() -> Void) {
//        recorderFader.gain = recorderGainValue
//        callback()
//    }
    

}
