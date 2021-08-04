//
//  Delays.swift
//  FinaleProject5DSynth
//
//  Created by דוד נוי on 28/07/2021.
//

import Foundation
import AudioKit
import SoundpipeAudioKit

class Delays {
    
    let delay:VariableDelay
    let dryWetMix:DryWetMixer
    
    init(_ node: Node) {
        
        delay = VariableDelay(node, time: 0.4, feedback: 0.3, maximumTime: 5)
        dryWetMix = DryWetMixer(node, delay)
        
        dryWetMix.play()
        dryWetMix.balance = 0.4
    }
    
    func bypass(){
        delay.bypass()
        print("off")
    }
    
    func play(){
        delay.play()
        print("on")
    }
    
    func setFeedback(feedbackPrecent: AUValue){
        delay.feedback = feedbackPrecent / 100
    }
    
    func setTime(milliSecend: AUValue){
        delay.time = milliSecend / 1000
    }
    
    
    func setMix(mixPrecent: AUValue){
        dryWetMix.balance = mixPrecent / 100
    }
    
}
