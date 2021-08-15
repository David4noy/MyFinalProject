//
//  Delays.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit
import DunneAudioKit
import AudioKitEX

class Delays {
    
    let delay:VariableDelay
    let stereoDelay:StereoDelay
    let dryWetMix:DryWetMixer
    let fader:Fader
    var delaysType:DelaysType = .variableDelay
    var isPlayng = false
    
    init(_ node: Node) {
        
        delay = VariableDelay(node, time: 0.4, feedback: 0.3, maximumTime: 5)
        dryWetMix = DryWetMixer(node, delay)
        
        dryWetMix.play()
        dryWetMix.balance = 0.4
        
        stereoDelay = StereoDelay(dryWetMix, time: 0.4, feedback: 0.3, dryWetMix: 0.4, pingPong: false, maximumDelayTime: 5)
        
        fader = Fader(stereoDelay, gain: 1)
    }
    
    func bypass(){
        delay.bypass()
        stereoDelay.bypass()
        resetDelay()
    }
    
    func play(){
        
        bypass()
        
        switch delaysType {
        case .variableDelay:
            delay.play()
        case .stereoDelay:
            stereoDelay.play()
        }
    }
    
    func resetDelay(){
        delay.reset()
        stereoDelay.reset()
    }
    
    func setGain(_ gain:AUValue){
        fader.gain = gain
    }
    
    func setFeedback(feedbackPrecent: AUValue){
        let feedback = feedbackPrecent / 100
        
        switch delaysType {
        case .variableDelay:
            delay.feedback = feedback
        case .stereoDelay:
            stereoDelay.feedback = feedback
        }
    }
    
    func setTime(milliSecend: AUValue){
        let time = milliSecend / 1000
        
        switch delaysType {
        case .variableDelay:
            delay.time = time
        case .stereoDelay:
            stereoDelay.time = time
        }
    }
    
    
    func setMix(mixPrecent: AUValue){
        let balance = mixPrecent / 100
        
        switch delaysType {
        case .variableDelay:
            dryWetMix.balance = balance
        case .stereoDelay:
            stereoDelay.dryWetMix = balance
        }
    }
    
    func setDelayType(_ type:Int){
        
        switch type {
        case 0:
            delaysType = .variableDelay
        case 1:
            delaysType = .stereoDelay
        default:
            delaysType = .variableDelay
        }
        if isPlayng{
            play()
        }
    }
    
}

enum DelaysType {
    case variableDelay
    case stereoDelay
}
