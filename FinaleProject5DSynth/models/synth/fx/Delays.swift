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
    
    let variableDelay:VariableDelay
    let stereoDelay:StereoDelay
    let dryWetMix:DryWetMixer
    let fader:Fader
    let variableDelayFader:Fader
    var delaysType:DelaysType = .variableDelay
    var isPlayng = false
    
    init(_ node: Node) {
        
        variableDelay = VariableDelay(node, time: 0.4, feedback: 0.3, maximumTime: 6)
        dryWetMix = DryWetMixer(node, variableDelay)
        
        dryWetMix.play()
        dryWetMix.balance = 0.4
        variableDelayFader = Fader(dryWetMix)
        
        stereoDelay = StereoDelay(variableDelayFader, time: 0.4, feedback: 0.3, dryWetMix: 0.4, pingPong: true, maximumDelayTime: 6)
        
        fader = Fader(stereoDelay, gain: 1)
    }
    
    func bypass(){
        variableDelay.bypass()
        stereoDelay.bypass()
        resetDelay()
        isPlayng = false
    }
    
    func play(){
        
        bypass()
        
        switch delaysType {
        case .variableDelay:
            variableDelay.play()
        case .stereoDelay:
            stereoDelay.play()
        }
        isPlayng = true
    }
    
    func resetDelay(){
        variableDelay.reset()
        stereoDelay.reset()
    }
    
    func setGain(_ gain:AUValue){
        
        switch delaysType {
        case .variableDelay:
            variableDelayFader.gain = gain
        case .stereoDelay:
            fader.gain = gain
        }
        
    }
    
    func setFeedback(feedbackPrecent: AUValue){
        let feedback = feedbackPrecent / 100
        
        switch delaysType {
        case .variableDelay:
            variableDelay.feedback = feedback
        case .stereoDelay:
            stereoDelay.feedback = feedback
        }
    }
    
    func setTime(milliSecend: AUValue){
        let time = milliSecend / 1000
        
        switch delaysType {
        case .variableDelay:
            variableDelay.time = time
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
            stereoDelay.dryWetMix = 1 - balance
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
